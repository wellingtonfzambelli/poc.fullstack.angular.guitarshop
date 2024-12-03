namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class BasketDto
{
    public Guid Id { get; set; }
    public Guid BuyerId { get; set; }
    public IList<BasketItemDto> Items { get; set; }
}
