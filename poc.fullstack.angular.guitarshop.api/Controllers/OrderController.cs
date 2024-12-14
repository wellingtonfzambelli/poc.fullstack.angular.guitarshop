using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Dto;
using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;
using poc.fullstack.angular.guitarshop.api.Extensions;
using poc.fullstack.angular.guitarshop.api.Services.Redis;

namespace poc.fullstack.angular.guitarshop.api.Controllers;
public sealed class OrderController : Controller
{
    private readonly CartServices _cartService;
    private readonly GuitarShopContext _guitarShopContext;

    public OrderController(CartServices cartService, GuitarShopContext guitarShopContext)
    {
        _cartService = cartService;
        _guitarShopContext = guitarShopContext;
    }

    [HttpPost]
    public async Task<ActionResult<Order>> CreateOrderAsync(CreateOrderRequestDto request, CancellationToken ct)
    {
        var email = User.GetEmail();

        var cart = await _cartService.GetCartAsync(request.CartId);

        if (cart is null)
            return BadRequest("Cart not found");

        if (cart.PaymentIntentId is null)
            return BadRequest("No payment intent for this order");

        var items = new List<OrderItem>();

        foreach (var item in cart.Items)
        {
            var productItem = await _guitarShopContext.Products.FirstOrDefaultAsync(s => s.Id == item.ProductId, ct);

            if (productItem is null)
                return BadRequest("Problem with the order");

            var itemOrdered = new ProductItemOrdered
            {
                ProductId = item.ProductId,
                ProductName = item.ProductName,
                PictureUrl = item.PictureUrl
            };

            var orderItem = new OrderItem
            {
                ItemOrdered = itemOrdered,
                Price = productItem.Price,
                Quantity = item.Quantity
            };
            items.Add(orderItem);
        }

        var deliveryMethod = await _guitarShopContext.DeliveryMethods.FirstOrDefaultAsync(s => s.Id == request.DeliveryMethodId, ct);

        if (deliveryMethod is null)
            return BadRequest("No delivery method selected");

        var order = new Order
        {
            OrderItems = items,
            DeliveryMethod = deliveryMethod,
            ShippingAddress = request.ShippingAddress,
            Subtotal = items.Sum(x => x.Price * x.Quantity),
            PaymentSummary = request.PaymentSummary,
            BuyerEmail = email
        };

        _guitarShopContext.Orders.Add(order);

        return order;
    }

    [HttpGet]
    public async Task<ActionResult<IReadOnlyList<OrderResponseDto>>> GetOrdersForUserAsync(CancellationToken ct)
    {
        var email = User.GetEmail();

        var orders = await _guitarShopContext
            .Orders
            .Where(s => s.BuyerEmail == email)
            .OrderByDescending(s => s.OrderDate)
            .ToListAsync(ct);

        var ordersToReturn = orders.Select(s => s.ToDto()).ToList();

        return Ok(ordersToReturn);
    }

    [HttpGet("{id:int}")]
    public async Task<ActionResult<OrderResponseDto>> GetOrderIdAsync(Guid id, CancellationToken ct)
    {
        var email = User?.GetEmail();

        var order = await _guitarShopContext.Orders.FindAsync(id, ct);

        if (order is null)
            return NotFound();

        return order.ToDto();
    }
}