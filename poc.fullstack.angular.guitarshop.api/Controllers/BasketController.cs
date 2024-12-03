using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Dto;
using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public sealed class BasketController : ControllerBase
{
    private readonly ILogger<ProductController> _logger;
    private readonly GuitarShopContext _context;

    public BasketController(GuitarShopContext context, ILogger<ProductController> logger)
    {
        _context = context;
        _logger = logger;
    }

    [HttpGet(Name = "GetBasketAsync")]
    public async Task<ActionResult<BasketDto>> GetBasketAsync(CancellationToken ct)
    {
        Basket basket = await RetriveBasketAsync(ct);

        if (basket is null)
            return NoContent();

        return MapBasketToDto(basket);
    }

    [HttpPost]
    public async Task<IActionResult> AddItemToBasketAsync
    (
        [FromQuery] Guid productId,
        [FromQuery] int quantity,
        CancellationToken ct
    )
    {
        Basket basket = await RetriveBasketAsync(ct);

        if (basket is null)
            basket = CreateBasket();

        Product product = await _context.Products.FindAsync(productId, ct);
        if (product is null)
            return BadRequest(new ProblemDetails { Title = "Product not found" });

        basket.AddItem(product, quantity);

        var result = await _context.SaveChangesAsync() > 0;

        if (result)
            return CreatedAtRoute("GetBasketAsync", MapBasketToDto(basket));

        return BadRequest(new ProblemDetails { Title = "Problem saving item to basket" });
    }

    [HttpDelete]
    public async Task<IActionResult> RemoveBasketItemAsync(
        Guid productId, int quantity, CancellationToken ct)
    {
        var basket = await RetriveBasketAsync(ct);

        if (basket is null)
            return NotFound();

        basket.RemoveItem(productId, quantity);

        var result = await _context.SaveChangesAsync(ct) > 0;

        if (result)
            return Ok();

        return BadRequest(new ProblemDetails { Title = "Problem removing item from the basket" });
    }

    private async Task<Basket> RetriveBasketAsync(CancellationToken ct)
    {
        if (Request.Cookies["buyerId"] is null)
            return null;

        Guid buyerId = Guid.Parse(Request.Cookies["buyerId"]);

        return await _context.Baskets
            .Include(i => i.Items)
            .ThenInclude(p => p.Product)
            .SingleOrDefaultAsync(x => x.BuyerId == buyerId, ct);
    }

    private Basket CreateBasket()
    {
        var buyerId = Guid.NewGuid();

        var cookieOptions = new CookieOptions
        {
            IsEssential = true,
            Expires = DateTime.Now.AddDays(30)
        };

        Response.Cookies.Append("buyerId", buyerId.ToString(), cookieOptions);

        var basket = new Basket(buyerId);

        _context.Baskets.Add(basket);
        return basket;
    }

    private BasketDto MapBasketToDto(Basket basket) =>
        new BasketDto
        {
            Id = basket.Id,
            BuyerId = basket.BuyerId,
            Items = basket.Items.Select(item => new BasketItemDto
            {
                ProductId = item.ProductId,
                Quantity = item.Quantity,
                Name = item.Product.Name,
                Price = item.Product.Price,
                PictureUrl = item.Product.PictureUrl,
                Type = item.Product.Type,
                Brand = item.Product.Brand
            }).ToList()
        };
}