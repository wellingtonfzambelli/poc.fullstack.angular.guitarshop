using poc.fullstack.angular.guitarshop.api.Dto;
using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

namespace poc.fullstack.angular.guitarshop.api.Extensions;

public static class OrderMappingExtensions
{
    public static OrderResponseDto ToDto(this Order order) =>
        new OrderResponseDto
        {
            Id = order.Id,
            BuyerEmail = order.BuyerEmail,
            OrderDate = order.OrderDate,
            ShippingAddress = order.ShippingAddress,
            PaymentSummary = order.PaymentSummary,
            DeliveryMethod = order.DeliveryMethod.Description,
            ShippingPrice = order.DeliveryMethod.Price,
            OrderItems = order.OrderItems.Select(x => x.ToDto()).ToList(),
            Subtotal = order.Subtotal,
            Total = order.GetTotal(),
            Status = order.Status.ToString(),
            PaymentIntentId = order.PaymentIntentId,
        };

    public static OrderItemResponseDto ToDto(this OrderItem orderItem) =>
        new OrderItemResponseDto
        {
            ProductId = orderItem.ItemOrdered.ProductId,
            ProductName = orderItem.ItemOrdered.ProductName,
            PictureUrl = orderItem.ItemOrdered.PictureUrl,
            Price = orderItem.Price,
            Quantity = orderItem.Quantity
        };
}