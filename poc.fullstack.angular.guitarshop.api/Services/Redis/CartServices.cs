using poc.fullstack.angular.guitarshop.api.Entities;
using StackExchange.Redis;
using System.Text.Json;

namespace poc.fullstack.angular.guitarshop.api.Services.Redis;

public sealed class CartServices(IConnectionMultiplexer redis) : ICartServices
{
    private readonly IDatabase _database = redis.GetDatabase();

    public async Task<bool> DeleteCartAsync(string key) =>
        await _database.KeyDeleteAsync(key);

    public async Task<ShoppingCart> GetCartAsync(string key)
    {
        var data = await _database.StringGetAsync(key);
        return data.IsNullOrEmpty ? null : JsonSerializer.Deserialize<ShoppingCart>(data!);
    }

    public async Task<ShoppingCart?> SetCartAsync(ShoppingCart cart)
    {
        var created = await _database.StringSetAsync(
            cart.Id,
            JsonSerializer.Serialize(cart),
            TimeSpan.FromDays(30)); // expiration data

        if (!created)
            return null;

        return await GetCartAsync(cart.Id);
    }
}