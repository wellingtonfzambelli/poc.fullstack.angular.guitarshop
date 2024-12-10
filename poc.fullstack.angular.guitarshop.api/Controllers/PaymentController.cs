using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Services;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[ApiController]
[Route("api/v1/payment")]
public sealed class PaymentController : ControllerBase
{
    private readonly IPaymentService _paymentService;
    private readonly GuitarShopContext _guitarShopContext;

    public PaymentController(IPaymentService paymentService, GuitarShopContext guitarShopContext)
    {
        _paymentService = paymentService;
        _guitarShopContext = guitarShopContext;
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
}