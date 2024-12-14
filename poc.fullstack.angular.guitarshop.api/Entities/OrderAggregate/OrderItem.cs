using poc.fullstack.angular.guitarshop.api.Entities.Base;

namespace poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

public sealed class OrderItem : BaseEntity
{
    public ProductItemOrdered ItemOrdered { get; set; } = null!;
    public double Price { get; set; }
    public int Quantity { get; set; }
}