using poc.fullstack.angular.guitarshop.api.Entities.Base;
using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

public sealed class Order : BaseEntity
{
    public DateTime OrderDate { get; set; } = DateTime.UtcNow;

    public string BuyerEmail { get; set; }

    public ShippingAddress ShippingAddress { get; set; } = null!;

    public DeliveryMethod DeliveryMethod { get; set; } = null!;

    public PaymentSummary PaymentSummary { get; set; } = null!;

    public IList<OrderItem> OrderItems { get; set; } = [];

    public double Subtotal { get; set; }

    public OrderStatus Status { get; set; } = OrderStatus.Pending;

    [Required]
    public string PaymentIntentId { get; set; }

    public double GetTotal() =>
        Subtotal + DeliveryMethod.Price;

}