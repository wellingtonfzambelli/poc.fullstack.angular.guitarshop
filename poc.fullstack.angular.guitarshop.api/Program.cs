using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Configuration;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Data.Seed;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Middleware;
using poc.fullstack.angular.guitarshop.api.Services;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddHttpContextAccessor();


// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// CORS
builder.Services.AddCors();

// Database
builder.Services.AddDatabasesConfiguration(builder.Configuration);

// Redis
builder.Services.AddRedisConfiguration(builder.Configuration);

// Identity
builder.Services.AddIdentityConfiguration();

builder.Services.AddScoped<IPaymentService, PaymentService>();

var app = builder.Build();



app.UseMiddleware<ExceptionMiddleware>();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    // EF SEED
    var scope = app.Services.CreateScope();
    var context = scope.ServiceProvider.GetRequiredService<GuitarShopContext>();
    var logger = scope.ServiceProvider.GetRequiredService<ILogger<Program>>();

    try
    {
        context.Database.Migrate();
        DbInitializer.InitializeProduct(context);
        DbInitializer.InitializeDelivery(context);
    }
    catch (Exception ex)
    {
        logger.LogError(ex, "A problem occured during Migration");
    }
}

//app.UseDefaultFiles();
//app.UseStaticFiles();

// CORS
app.UseCors(opt =>
{
    opt.AllowAnyHeader()
       .AllowAnyMethod()
       .AllowCredentials()
       .WithOrigins("https://localhost:4200");
});

app.UseAuthorization();
app.MapControllers();

app.MapGroup("api/v1/").MapIdentityApi<UserAppIdentity>(); //api/v1/login

//app.MapFallbackToController("Index", "Fallback");

app.Run();