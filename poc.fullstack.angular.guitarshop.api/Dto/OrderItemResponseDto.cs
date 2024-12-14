namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class OrderItemResponseDto
{
    public Guid ProductId { get; set; }
    public required string ProductName { get; set; }
    public required string PictureUrl { get; set; }
    public double Price { get; set; }
    public int Quantity { get; set; }
}
