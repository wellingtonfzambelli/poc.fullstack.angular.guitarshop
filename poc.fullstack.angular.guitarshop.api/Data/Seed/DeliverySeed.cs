using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Data.Seed;

public static class DeliverySeed
{
    public static List<DeliveryMethod> GetSeed() =>
        new List<DeliveryMethod>
        {
            new DeliveryMethod
            {
                ShortName = "UPS1",
                Description = "Fastest delivery time",
                DeliveryTime = "1-2 Days",
                Price = 10
            },
            new DeliveryMethod
            {
                ShortName = "UPS2",
                Description = "Get it within 5 days",
                DeliveryTime = "2-5 Days",
                Price = 5
            },
            new DeliveryMethod
            {
                ShortName = "UPS3",
                Description = "Slower but cheap",
                DeliveryTime = "5-10 Days",
                Price = 2
            },
            new DeliveryMethod
            {
                ShortName = "FREE",
                Description = "Free! You get what you pay for",
                DeliveryTime = "1-2 Weeks",
                Price = 0
            },
        };
}