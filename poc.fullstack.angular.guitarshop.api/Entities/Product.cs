using poc.fullstack.angular.guitarshop.api.Entities.Base;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class Product : BaseEntity
{
    public string Name { get; set; }
    public string Description { get; set; }
    public double Price { get; set; }
    public string PictureUrl { get; set; }
    public string Type { get; set; }
    public string Brand { get; set; }
    public int QuantityInStock { get; set; }
}