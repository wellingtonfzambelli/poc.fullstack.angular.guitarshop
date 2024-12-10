using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Services.Redis;

public interface ICartServices
{
    Task<ShoppingCart> GetCartAsync(string key);
    Task<ShoppingCart?> SetCartAsync(ShoppingCart cart);
    Task<bool> DeleteCartAsync(string key);
}
