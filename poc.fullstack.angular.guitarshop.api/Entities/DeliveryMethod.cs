using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class DeliveryMethod
{
    [Key]
    public int Id { get; set; }

    [Required]
    public string ShortName { get; set; }

    [Required]
    public string DeliveryTime { get; set; }

    [Required]
    public string Description { get; set; }

    public double Price { get; set; }
}
