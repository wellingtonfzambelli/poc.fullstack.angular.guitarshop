namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class BasketItemDto
{
    public Guid ProductId { get; set; }
    public string Name { get; set; }
    public double Price { get; set; }
    public string PictureUrl { get; set; }
    public string Type { get; set; }
    public string Brand { get; set; }
    public int Quantity { get; set; }
}