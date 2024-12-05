using Microsoft.AspNetCore.Mvc;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[ApiController]
[Route("api/v1/mock-error")]
public sealed class MockErrorController : ControllerBase
{
    [HttpGet("not-found")]
    public IActionResult GetNotFoundAsync() =>
        NotFound();

    [HttpGet("bad-request")]
    public IActionResult GetBadRequest() =>
        BadRequest(new ProblemDetails { Title = "This is a bad request" });

    [HttpGet("unauthorized")]
    public IActionResult GetUnauthorized() =>
        Unauthorized();

    [HttpGet("validation-error")]
    public IActionResult GetValidationErrord()
    {
        ModelState.AddModelError("Problem1", "This is the first error");
        ModelState.AddModelError("Problem1", "This is the second error");

        return ValidationProblem();
    }

    [HttpGet("server-error")]
    public IActionResult GetExceptiond() =>
        throw new Exception("This is a server error");
}