using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class Product
{
    [Key]
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public double Price { get; set; }
    public string PictureUrl { get; set; }
    public string Type { get; set; }
    public string Brand { get; set; }
    public int QuantityInStock { get; set; }
}