using poc.fullstack.angular.guitarshop.api.Entities.Base;
using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class DeliveryMethod : BaseEntity
{
    [Required]
    public string ShortName { get; set; }

    [Required]
    public string DeliveryTime { get; set; }

    [Required]
    public string Description { get; set; }

    public double Price { get; set; }
}
