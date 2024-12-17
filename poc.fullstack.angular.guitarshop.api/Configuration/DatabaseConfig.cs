using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;

namespace poc.fullstack.angular.guitarshop.api.Configuration;

public static class DatabaseConfig
{
    public static void AddDatabasesConfiguration(this IServiceCollection services, IConfiguration config)
    {
        services.AddDbContext<GuitarShopContext>(options =>
            options.UseSqlServer(config.GetConnectionString("DefaultConnection")));
    }
}