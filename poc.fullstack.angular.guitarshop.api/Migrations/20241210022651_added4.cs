using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace poc.fullstack.angular.guitarshop.api.Migrations;

/// <inheritdoc />
public partial class added4 : Migration
{
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropForeignKey(
            name: "FK_AspNetUsers_Address_AddressId",
            table: "AspNetUsers");

        migrationBuilder.DropPrimaryKey(
            name: "PK_Address",
            table: "Address");

        migrationBuilder.RenameTable(
            name: "Address",
            newName: "Addresses");

        migrationBuilder.AddPrimaryKey(
            name: "PK_Addresses",
            table: "Addresses",
            column: "Id");

        migrationBuilder.CreateTable(
            name: "DeliveryMethods",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                ShortName = table.Column<string>(type: "longtext", nullable: false)
                    .Annotation("MySql:CharSet", "utf8mb4"),
                DeliveryTime = table.Column<string>(type: "longtext", nullable: false)
                    .Annotation("MySql:CharSet", "utf8mb4"),
                Description = table.Column<string>(type: "longtext", nullable: false)
                    .Annotation("MySql:CharSet", "utf8mb4"),
                Price = table.Column<decimal>(type: "decimal(65,30)", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_DeliveryMethods", x => x.Id);
            })
            .Annotation("MySql:CharSet", "utf8mb4");

        migrationBuilder.AddForeignKey(
            name: "FK_AspNetUsers_Addresses_AddressId",
            table: "AspNetUsers",
            column: "AddressId",
            principalTable: "Addresses",
            principalColumn: "Id");
    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropForeignKey(
            name: "FK_AspNetUsers_Addresses_AddressId",
            table: "AspNetUsers");

        migrationBuilder.DropTable(
            name: "DeliveryMethods");

        migrationBuilder.DropPrimaryKey(
            name: "PK_Addresses",
            table: "Addresses");

        migrationBuilder.RenameTable(
            name: "Addresses",
            newName: "Address");

        migrationBuilder.AddPrimaryKey(
            name: "PK_Address",
            table: "Address",
            column: "Id");

        migrationBuilder.AddForeignKey(
            name: "FK_AspNetUsers_Address_AddressId",
            table: "AspNetUsers",
            column: "AddressId",
            principalTable: "Address",
            principalColumn: "Id");
    }
}
