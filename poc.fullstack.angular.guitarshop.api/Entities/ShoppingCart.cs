namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class ShoppingCart
{
    public required string Id { get; set; }
    public List<CartItem> Items { get; set; } = [];
}