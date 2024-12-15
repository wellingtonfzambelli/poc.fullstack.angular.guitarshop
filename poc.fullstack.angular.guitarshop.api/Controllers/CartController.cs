using Microsoft.AspNetCore.Mvc;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Services.Redis;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[ApiController]
[Route("api/v1/cart")]
public sealed class CartController(ICartService _cartService) : ControllerBase
{
    [HttpGet]
    public async Task<ActionResult<ShoppingCart>> GetCartByIdAsync(string id, CancellationToken cancellationToken)
    {
        var cart = await _cartService.GetCartAsync(id);

        return Ok(cart ?? new ShoppingCart { Id = id });
    }

    [HttpPost]
    public async Task<ActionResult<ShoppingCart>> UpdateCartAsync([FromBody] ShoppingCart cart, CancellationToken ct)
    {
        var updatedCart = await _cartService.SetCartAsync(cart);

        if (updatedCart is null)
            return BadRequest("Problem with cart");

        return updatedCart;
    }

    [HttpDelete]
    public async Task<ActionResult> DeleteCart(string id, CancellationToken ct)
    {
        var result = await _cartService.DeleteCartAsync(id);

        if (!result)
            return BadRequest("Problem deleting cart");

        return Ok();
    }
}