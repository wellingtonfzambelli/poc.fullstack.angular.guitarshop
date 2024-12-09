using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Dto;
using poc.fullstack.angular.guitarshop.api.Entities;
using poc.fullstack.angular.guitarshop.api.Extensions;
using System.Security.Claims;

namespace poc.fullstack.angular.guitarshop.api.Controllers;

[Route("api/v1/account")]
public class AccountController : ControllerBase
{
    private readonly SignInManager<UserAppIdentity> _signManager;

    public AccountController(SignInManager<UserAppIdentity> signManager) => 
        _signManager = signManager;

    [HttpPost("register")]
    public async Task<ActionResult> RegisterAsync([FromBody]AccountRegisterRequestDto request, CancellationToken ct)
    {
        var user = new UserAppIdentity
        {
            FirstName = request.FirstName,
            LastName = request.LastName,
            Email = request.Email,
            UserName = request.Email
        };

        var result = await _signManager.UserManager.CreateAsync(user, request.Password);

        if (!result.Succeeded)
        {
            foreach (var error in result.Errors) 
                ModelState.AddModelError(error.Code, error.Description);

            return ValidationProblem();
        }

        return Ok();
    }

    [Authorize]
    [HttpPost("logout")]
    public async Task<ActionResult> LogoutAsync(CancellationToken ct)
    {
        await _signManager.SignOutAsync();

        return NoContent();
    }
    
    [HttpGet("user-info")]
    public async Task<ActionResult> GetUserInfoAsync(CancellationToken ct)
    {
        if (User.Identity?.IsAuthenticated == false)
            return NoContent();

        var user = await _signManager.UserManager.GetUserByEmailAsync(user);

        return Ok(new 
        { 
            user.FirstName,
            user.LastName,
            user.Email
        });
    }

    [HttpGet("user-info")]
    public async Task<ActionResult> GetAuthAsync(CancellationToken ct) =>
        Ok(new { isAuthenticated = User.Identity?.IsAuthenticated ?? false });

    [Authorize]
    [HttpPost("address")]
    public async Task<ActionResult<Address>> CreateOrUpdateAddressAsync(Address address, CancellationToken ct)
    {
        var user = await _signManager.UserManager.GetUserByEmailWithAddress(User);

        user.Address = address;

        var result = await _signManager.UserManager.UpdateAsync(user);

        if (!result.Succeeded)
            return BadRequest("Problem updation user address");

        return Ok(user.Address);
    }
}
