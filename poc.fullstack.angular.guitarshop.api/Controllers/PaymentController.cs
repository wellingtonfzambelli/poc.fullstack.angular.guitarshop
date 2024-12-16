using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;
using poc.fullstack.angular.guitarshop.api.Services;
using Stripe;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[ApiController]
[Route("api/v1/payment")]
public sealed class PaymentController : ControllerBase
{
    private readonly IPaymentService _paymentService;
    private readonly GuitarShopContext _guitarShopContext;
    private readonly string _whSecret;
    private readonly ILogger<PaymentController> _logger;

    public PaymentController
    (
        IPaymentService paymentService, 
        GuitarShopContext guitarShopContext,
        IConfiguration configuration,
        ILogger<PaymentController> logger
    )
    {
        _paymentService = paymentService;
        _guitarShopContext = guitarShopContext;
        _whSecret = configuration["StripeSettings:WhSecret"];
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
    public async Task<IActionResult> StripeWebhook()
    { 
        var json = await new StreamReader(Request.Body).ReadToEndAsync();

        try
        {
            var stripeEvent = ConstructStripeEvent(json);

            if (stripeEvent.Data.Object is not PaymentIntent intent)
                return BadRequest("Invalid event data");

            await HandlePaymentIntentSuccededAsync(intent);

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

    private async Task HandlePaymentIntentSuccededAsync(PaymentIntent intent)
    {
        if (intent.Status == "succeeded")
        {
            var order = await _guitarShopContext
                .Orders
                .Include(s => s.OrderItems)
                .Include(S => S.DeliveryMethod)
                .FirstOrDefaultAsync(s => s.PaymentIntentId == intent.Id);

            if (order is null)
                throw new Exception("Order not found");

            if ((long)order.GetTotal() * 100 != intent.Amount)
                order.Status = OrderStatus.PaymentMismatch;
            else
                order.Status = OrderStatus.PaymentReceived;
        }
    }
}