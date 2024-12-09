using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities.Base;

public abstract class BaseEntity
{
    [Key]
    public Guid Id { get; set; }
}