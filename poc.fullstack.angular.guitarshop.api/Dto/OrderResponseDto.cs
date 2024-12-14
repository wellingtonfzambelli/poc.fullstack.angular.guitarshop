using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class OrderResponseDto
{
    public Guid Id { get; set; }
    public DateTime OrderDate { get; set; }
    public required string BuyerEmail { get; set; }
    public required ShippingAddress ShippingAddress { get; set; }
    public required string DeliveryMethod { get; set; }
    public double ShippingPrice { get; set; }
    public required PaymentSummary PaymentSummary { get; set; }
    public required List<OrderItemResponseDto> OrderItems { get; set; }
    public double Subtotal { get; set; }
    public required string Status { get; set; }
    public double Total { get; set; }
    public required string PaymentIntentId { get; set; }
}