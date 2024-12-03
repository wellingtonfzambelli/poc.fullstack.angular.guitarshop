using Microsoft.EntityFrameworkCore;

namespace poc.fullstack.angular.guitarshop.api.Helper.Pagination;

public sealed class PagedList<T> : List<T>
{
    public PagedList(List<T> items, int count, int pageNumber, int pageSize)
    {
        PaginationMetaDataDto = new PaginationMetaDataDto
        {
            TotalCount = count,
            PageSize = pageSize,
            CurrentPage = pageNumber,
            TotalPages = (int)Math.Ceiling(count / (double)pageSize)
        };

        AddRange(items);
    }

    public PaginationMetaDataDto PaginationMetaDataDto { get; set; }

    public static async Task<PagedList<T>> ToPagedList
    (
        IQueryable<T> query,
        int pageNumber,
        int pageSize,
        CancellationToken ct
    )
    {
        var count = await query.CountAsync(ct);
        var items = await query
                            .Skip((pageNumber - 1) * pageSize)
                            .Take(pageSize)
                            .ToListAsync(ct);

        return new PagedList<T>(items, count, pageNumber, pageSize);
    }
}