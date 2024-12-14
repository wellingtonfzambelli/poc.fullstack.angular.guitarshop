using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Data.Config;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

namespace poc.fullstack.angular.guitarshop.api.Data;

public sealed class GuitarShopContext(DbContextOptions options) : IdentityDbContext<UserAppIdentity>(options)
{
    public DbSet<Product> Products { get; set; }
    public DbSet<Address> Addresses { get; set; }
    public DbSet<DeliveryMethod> DeliveryMethods { get; set; }
    public DbSet<Order> Orders { get; set; }
    public DbSet<OrderItem> OrderItems { get; set; }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.ApplyConfiguration(new OrderConfiguration());
        builder.ApplyConfiguration(new OrderItemConfiguration());
    }
}