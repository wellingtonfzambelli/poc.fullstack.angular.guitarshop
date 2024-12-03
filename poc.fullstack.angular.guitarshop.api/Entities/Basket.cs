namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class Basket
{
    public Basket(Guid buyerId) =>
        BuyerId = buyerId;

    public Guid Id { get; private set; }
    public Guid BuyerId { get; private set; }

    public IList<BasketItem> Items { get; private set; } = new List<BasketItem>();

    public void AddItem(Product product, int quantity)
    {
        if (Items.All(s => s.ProductId != product.Id))
            Items.Add(new BasketItem
            {
                Product = product,
                Quantity = quantity
            });

        var existsItem = Items.SingleOrDefault(item => item.ProductId == product.Id);
        if (existsItem != null)
            existsItem.Quantity += quantity;
    }

    public void RemoveItem(Guid productId, int quantity)
    {
        var item = Items.SingleOrDefault(s => s.ProductId == productId);

        if (item is null)
            return;

        item.Quantity -= quantity;
        if (item.Quantity == 0)
            Items.Remove(item);
    }
}