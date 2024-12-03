namespace poc.fullstack.angular.guitarshop.api.Helper.Pagination;

public abstract class PaginationPraramsDto
{
    private const int _maxPageSize = 50;
    private int _pageSize = 6;
    public int PageNumber { get; set; } = 1;

    public int PageSize
    {
        get => _pageSize;
        set => _pageSize = value > _maxPageSize ? _maxPageSize : value;
    }
}