using Microsoft.AspNetCore.Mvc;

namespace poc.fullstack.angular.guitarshop.api.Controllers;
public sealed class FallbackController : Controller
{
    public IActionResult Index() =>
        PhysicalFile(Path.Combine(Directory.GetCurrentDirectory(),
            "wwwroot", "index.html"), "text/HTML");
}