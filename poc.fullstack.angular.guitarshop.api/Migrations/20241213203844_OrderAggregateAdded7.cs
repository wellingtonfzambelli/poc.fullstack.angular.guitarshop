using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace poc.fullstack.angular.guitarshop.api.Migrations
{
    /// <inheritdoc />
    public partial class OrderAggregateAdded7 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "OrderItem",
                type: "decimal(18,2)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(65,30)");

            migrationBuilder.AddColumn<string>(
                name: "ItemOrdered_PictureUrl",
                table: "OrderItem",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<int>(
                name: "ItemOrdered_ProductId",
                table: "OrderItem",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "ItemOrdered_ProductName",
                table: "OrderItem",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ItemOrdered_PictureUrl",
                table: "OrderItem");

            migrationBuilder.DropColumn(
                name: "ItemOrdered_ProductId",
                table: "OrderItem");

            migrationBuilder.DropColumn(
                name: "ItemOrdered_ProductName",
                table: "OrderItem");

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "OrderItem",
                type: "decimal(65,30)",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");
        }
    }
}
