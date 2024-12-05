using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class CreateProductRequestDto
{
    [Key]
    public Guid Id { get; set; }

    [Required]
    public string Name { get; set; }

    [Required]
    public string Description { get; set; }

    [Range(0.01, double.MaxValue, ErrorMessage = "Price must be greater than 0")]
    public double Price { get; set; }

    [Required]
    public string PictureUrl { get; set; }

    [Required]
    public string Type { get; set; }

    [Required]
    public string Brand { get; set; }

    [Range(1, int.MaxValue, ErrorMessage = "Quantity in stock must be at least 1 item")]
    public int QuantityInStock { get; set; }
}