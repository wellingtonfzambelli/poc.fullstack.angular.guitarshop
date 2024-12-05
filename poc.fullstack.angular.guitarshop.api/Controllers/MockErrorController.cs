using Microsoft.AspNetCore.Mvc;
using poc.fullstack.angular.guitarshop.api.Dto;

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

    [HttpPost("validation-error")]
    public IActionResult GetValidationError(CreateProductRequestDto request)
    {
        if (ModelState.IsValid)
            return Ok();

        return BadRequest(ModelState);
    }

    [HttpGet("server-error")]
    public IActionResult GetExceptiond() =>
        throw new Exception("This is a server error");
}