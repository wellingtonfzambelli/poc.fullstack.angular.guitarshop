using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;
using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class CreateOrderRequestDto
{
    [Required]
    public string CartId { get; set; } = string.Empty;

    public Guid DeliveryMethodId { get; set; }

    public ShippingAddress ShippingAddress { get; set; }

    public PaymentSummary PaymentSummary { get; set; }
}