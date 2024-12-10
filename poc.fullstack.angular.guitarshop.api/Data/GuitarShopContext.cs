using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Data;

public sealed class GuitarShopContext(DbContextOptions options) : IdentityDbContext<UserAppIdentity>(options)
{
    public DbSet<Product> Products { get; set; }
    public DbSet<Address> Addresses { get; set; }
    public DbSet<DeliveryMethod> DeliveryMethods { get; set; }
}