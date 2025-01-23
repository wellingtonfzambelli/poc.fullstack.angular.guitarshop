using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data;

namespace poc.fullstack.angular.guitarshop.api.Configuration;

public static class DatabaseConfig
{
    public static void AddDatabasesConfiguration(this IServiceCollection services, IConfiguration config)
    {
        services.AddDbContext<GuitarShopContext>(options =>
                options.UseMySql(config.GetConnectionString("DefaultConnection"),
                    new MySqlServerVersion(new Version(8, 0, 39))));
    }
}