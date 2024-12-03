namespace poc.fullstack.angular.guitarshop.api.Helper.Pagination;

public sealed class PaginationMetaDataDto
{
    public int CurrentPage { get; set; }
    public int TotalPages { get; set; }
    public int PageSize { get; set; }
    public int TotalCount { get; set; }
}