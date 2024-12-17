using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;
using poc.fullstack.angular.guitarshop.api.Extensions;
using poc.fullstack.angular.guitarshop.api.Services;
using poc.fullstack.angular.guitarshop.api.SignalR;
using Stripe;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[ApiController]
[Route("api/v1/payment")]
public sealed class PaymentController : ControllerBase
{
    private readonly string _whSecret;
    private readonly GuitarShopContext _guitarShopContext;
    private readonly IPaymentService _paymentService;
    private readonly IHubContext<NotificationHub> _hubContext;
    private readonly ILogger<PaymentController> _logger;

    public PaymentController
    (
        GuitarShopContext guitarShopContext,
        IPaymentService paymentService,
        IConfiguration configuration,
        IHubContext<NotificationHub> hubContext,
        ILogger<PaymentController> logger
    )
    {
        _whSecret = configuration["StripeSettings:WhSecret"];
        _guitarShopContext = guitarShopContext;
        _paymentService = paymentService;
        _hubContext = hubContext;
        _logger = logger;
    }

    [Authorize]
    [HttpPost("{cartId}")]
    public async Task<ActionResult<ShoppingCart>> CreateOrUpdatePaymentIntentAsync(string cartId, CancellationToken ct)
    {
        var cart = await _paymentService.CreateOrUpdatePaymentIntentAsync(cartId, ct);

        if (cart is null)
            return BadRequest("Problem with your cart");

        return Ok(cart);
    }

    [HttpGet("delivery-methods")]
    public async Task<ActionResult<IReadOnlyList<DeliveryMethod>>> GetDeliveryMethodsAsync(CancellationToken ct) =>
        Ok(await _guitarShopContext.DeliveryMethods.ToListAsync(ct));

    [HttpPost("webhook")]
    public async Task<IActionResult> StripeWebhookAsync(CancellationToken ct)
    {
        Thread.Sleep(5000);

        var json = await new StreamReader(Request.Body).ReadToEndAsync();

        try
        {
            var stripeEvent = ConstructStripeEvent(json);

            if (stripeEvent.Data.Object is not PaymentIntent intent)
                return BadRequest("Invalid event data");

            await HandlePaymentIntentSuccededAsync(intent, ct);

            return Ok();
        }
        catch (StripeException ex)
        {
            _logger.LogError(ex, "Stripe webhook error");
            return StatusCode(StatusCodes.Status500InternalServerError, "Webhook error");
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "An unexpected error occurred");
            return StatusCode(StatusCodes.Status500InternalServerError, "Webhook error");
        }
    }

    private Event ConstructStripeEvent(string json)
    {
        try
        {
            return EventUtility.ConstructEvent(json, Request.Headers["Stripe-Signature"], _whSecret);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to construct stripe event");
            throw new StripeException("Invalid signature");
        }
    }

    private async Task HandlePaymentIntentSuccededAsync(PaymentIntent intent, CancellationToken ct)
    {
        if (intent.Status == "succeeded")
        {
            var order = await _guitarShopContext
                .Orders
                .Include(s => s.OrderItems)
                .Include(s => s.DeliveryMethod)
                .FirstOrDefaultAsync(s => s.PaymentIntentId == intent.Id);

            if (order is null)
                throw new Exception("Order not found");

            if (order.GetTotal() != (intent.Amount / 100.0))
                order.Status = OrderStatus.PaymentMismatch;
            else
                order.Status = OrderStatus.PaymentReceived;

            _guitarShopContext.Update(order);
            await _guitarShopContext.SaveChangesAsync();

            await SendSignalRMessageAsync(order, ct);
        }
    }

    private async Task SendSignalRMessageAsync(Order order, CancellationToken ct)
    {
        var connectionId = NotificationHub.GetConnectionIdByEmail(order.BuyerEmail);

        if (!string.IsNullOrWhiteSpace(connectionId))
        {
            await _hubContext.Clients.Client(connectionId)
                .SendAsync("OrderCompleteNotification", order.ToDto(), ct);
        }
    }
}