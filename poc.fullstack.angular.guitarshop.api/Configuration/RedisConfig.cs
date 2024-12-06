using poc.fullstack.angular.guitarshop.api.Redis;
using StackExchange.Redis;

namespace poc.fullstack.angular.guitarshop.api.Configuration;

public static class RedisConfig
{
    public static void AddRedisConfiguration(this IServiceCollection services, IConfiguration configuration)
    {
        var redisConfig = configuration.GetSection("RedisConnection");
        
        if (redisConfig == null)
            throw new Exception("Redis configuration section is missing.");
        
        var connectionString = $"{redisConfig["Host"]}:{redisConfig["Port"]},password={redisConfig["Password"]},user={redisConfig["User"]}";
        
        services.AddSingleton<IConnectionMultiplexer>(config =>
        {
            if (string.IsNullOrWhiteSpace(connectionString))
                throw new Exception("Cannot get Redis connection string");

            var configurationOptions = ConfigurationOptions.Parse(connectionString, true);
            return ConnectionMultiplexer.Connect(configurationOptions);
        });
        
        services.AddSingleton<ICartServices, CartServices>();
    }
}