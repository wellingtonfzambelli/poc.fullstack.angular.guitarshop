using poc.fullstack.angular.guitarshop.api.Helper.Pagination;

namespace poc.fullstack.angular.guitarshop.api.Dto;

public sealed class ProductPaginationParamsRequestDto : PaginationPraramsDto
{
    public string OrderBy { get; set; }
    public string SearchTerm { get; set; }
    public string Types { get; set; }
    public string Brands { get; set; }
}