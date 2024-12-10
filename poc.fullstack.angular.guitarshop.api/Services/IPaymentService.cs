using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Services;

public interface IPaymentService
{
    Task<ShoppingCart> CreateOrUpdatePaymentIntentAsync(string cartId, CancellationToken ct);
}