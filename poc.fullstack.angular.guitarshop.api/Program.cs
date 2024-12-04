using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Configuration;
using poc.fullstack.angular.guitarshop.api.Data;
using poc.fullstack.angular.guitarshop.api.Middleware;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddHttpContextAccessor();

IConfiguration _configuration = null;
string _path = null;

builder.Host.ConfigureAppConfiguration((hostingContext, configurationBuilder) =>
{
    var env = hostingContext.HostingEnvironment;

    configurationBuilder.SetBasePath(env.ContentRootPath);
    _path = env.ContentRootPath;

    configurationBuilder
        .AddEnvironmentVariables()
        .AddCommandLine(Environment.GetCommandLineArgs());

    _configuration = configurationBuilder.Build();
});

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDatabasesConfiguration(_configuration);

// CORS
builder.Services.AddCors();

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
        DbInitializer.Initialize(context);
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
//app.MapFallbackToController("Index", "Fallback");

app.Run();