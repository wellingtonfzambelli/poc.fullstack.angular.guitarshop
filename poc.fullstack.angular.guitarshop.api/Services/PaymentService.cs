using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Services.Redis;
using Stripe;

namespace poc.fullstack.angular.guitarshop.api.Services;

public sealed class PaymentService : IPaymentService
{
    private readonly IConfiguration _configuration;
    private readonly ICartService _cartServices;
    private readonly GuitarShopContext _context;

    public PaymentService(IConfiguration configuration, ICartService cartServices, GuitarShopContext context)
    {
        _configuration = configuration;
        _cartServices = cartServices;
        _context = context;
    }

    public async Task<ShoppingCart> CreateOrUpdatePaymentIntentAsync(string cartId, CancellationToken ct)
    {
        StripeConfiguration.ApiKey = _configuration["StripeSettings:SecretKey"];

        var cart = await _cartServices.GetCartAsync(cartId);

        if (cart is null)
            return null;

        var shippingPrice = 0d;

        if (cart.DeliveryMethodId.HasValue)
        {
            var deliveryMethod = await _context.DeliveryMethods.FirstOrDefaultAsync(s => s.Id == cart.DeliveryMethodId.Value, ct);

            if (deliveryMethod is null)
                return null;

            shippingPrice = deliveryMethod.Price;
        }

        foreach (var item in cart.Items)
        {
            var productItem = await _context.Products.FirstOrDefaultAsync(s => s.Id == item.ProductId, ct);

            if (productItem is null)
                return null;

            if (item.Price != productItem.Price)
                item.Price = productItem.Price;
        }

        var paymentIntentService = new PaymentIntentService();
        PaymentIntent? intent = null;

        if (string.IsNullOrEmpty(cart.PaymentIntentId))
        {
            var options = new PaymentIntentCreateOptions
            {
                Amount = (long)cart.Items.Sum(s => s.Quantity * (s.Price * 100))
                       + (long)shippingPrice * 100,
                Currency = "usd",
                PaymentMethodTypes = ["card"]

            };

            intent = await paymentIntentService.CreateAsync(options);
            cart.PaymentIntentId = intent.Id;
            cart.ClientSecret = intent.ClientSecret;
        }
        else
        {
            var options = new PaymentIntentUpdateOptions
            {
                Amount = (long)cart.Items.Sum(x => x.Quantity * (x.Price * 100))
                + (long)shippingPrice * 100,
            };

            intent = await paymentIntentService.UpdateAsync(cart.PaymentIntentId, options);
        }

        await _cartServices.SetCartAsync(cart);

        return cart;
    }
}