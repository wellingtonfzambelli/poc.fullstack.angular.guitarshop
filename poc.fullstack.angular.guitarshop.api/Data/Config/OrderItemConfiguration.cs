using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

namespace poc.fullstack.angular.guitarshop.api.Data.Config;

public sealed class OrderItemConfiguration : IEntityTypeConfiguration<OrderItem>
{
    public void Configure(EntityTypeBuilder<OrderItem> builder)
    {
        builder.OwnsOne(x => x.ItemOrdered, o => o.WithOwner());
        builder.Property(x => x.Price).HasColumnType("decimal(18,2)");
    }
}