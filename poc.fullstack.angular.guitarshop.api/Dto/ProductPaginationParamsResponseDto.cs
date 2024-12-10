using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class ProductPaginationParamsResponseDto
{
    public int CurrentPage { get; set; }
    public int TotalPages { get; set; }
    public int PageSize { get; set; }
    public int TotalCount { get; set; }
    public IList<Product> Data { get; set; } = new List<Product>();
}