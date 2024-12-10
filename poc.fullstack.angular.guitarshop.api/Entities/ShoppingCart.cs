using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class ShoppingCart
{
    [Required]
    public string Id { get; set; }
    public IList<CartItem> Items { get; set; } = [];
    public Guid? DeliveryMethodId { get; set; }
    public string? ClientSecret { get; set; }
    public string? PaymentIntentId { get; set; }
}