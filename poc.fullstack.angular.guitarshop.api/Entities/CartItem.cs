namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class CartItem
{
    public Guid ProductId { get; set; }
    public double Price { get; set; }
    public int Quantity { get; set; }
    public required string ProductName { get; set; }
    public required string PictureUrl { get; set; }
    public required string Brand { get; set; }
    public required string Type { get; set; }
}