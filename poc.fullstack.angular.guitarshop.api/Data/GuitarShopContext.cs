using Microsoft.EntityFrameworkCore;
using NuGet.ContentModel;
using poc.fullstack.angular.guitarshop.api.Entities;

namespace poc.fullstack.angular.guitarshop.api.Data;

public sealed class GuitarShopContext : DbContext
{
    public GuitarShopContext(DbContextOptions options) : base(options)
    {
    }

    public DbSet<Product> Products { get; set; }
    public DbSet<Basket> Baskets { get; set; }
}