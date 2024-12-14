namespace poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

public sealed class ProductItemOrdered
{
    public required Guid ProductId { get; set; }

    public required string ProductName { get; set; }

    public required string PictureUrl { get; set; }
}
