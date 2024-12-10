namespace poc.fullstack.angular.guitarshop.api.Data.Seed;

public static class DbInitializer
{
    public static void InitializeProduct(GuitarShopContext context)
    {
        if (context.Products.Any()) return;

        var products = ProductSeed.GetSeed();

        foreach (var product in products)
            context.Products.Add(product);

        context.SaveChanges();
    }

    public static void InitializeDelivery(GuitarShopContext context)
    {
        if (context.DeliveryMethods.Any()) return;

        var deliveries = DeliverySeed.GetSeed();

        foreach (var delivery in deliveries)
            context.DeliveryMethods.Add(delivery);

        context.SaveChanges();
    }
}