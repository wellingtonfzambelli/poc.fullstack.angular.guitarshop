using poc.fullstack.angular.guitarshop.api.Helper.Pagination;
using System.Text.Json;

namespace poc.fullstack.angular.guitarshop.api.Extensions;

public static class HttpExtensions
{
    public static void AddPagination(this HttpResponse response, PaginationMetaDataDto metaData)
    {
        var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };

        response.Headers.Append("Pagination", JsonSerializer.Serialize(metaData, options));
        response.Headers.Append("Access-Control-Expose-Headers", "Pagination");

    }
}