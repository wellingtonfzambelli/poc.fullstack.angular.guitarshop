namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class BasketItem
{
    public Guid Id { get; set; }
    public int Quantity { get; set; }

    public Guid ProductId { get; set; }
    public Product Product { get; set; }

    public Guid BasketId { get; set; }
    public Basket Basket { get; set; }
}