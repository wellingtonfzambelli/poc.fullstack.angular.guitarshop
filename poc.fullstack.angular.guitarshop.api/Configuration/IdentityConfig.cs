using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Configuration;

public static class IdentityConfig
{
    public static void AddIdentityConfiguration(this IServiceCollection services)
    {
        services
            .AddAuthorization()
            .AddIdentityApiEndpoints<UserAppIdentity>()
            .AddEntityFrameworkStores<GuitarShopContext>();
    }
}