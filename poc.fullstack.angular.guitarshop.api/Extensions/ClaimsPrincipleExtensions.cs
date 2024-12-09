using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using poc.fullstack.angular.guitarshop.api.Entities;
using System.Security.Authentication;
using System.Security.Claims;

namespace poc.fullstack.angular.guitarshop.api.Extensions;

public static class ClaimsPrincipleExtensions
{
    public static async Task<UserAppIdentity> GetUserByEmailAsync(
        this UserManager<UserAppIdentity> userManager, ClaimsPrincipal user)
    {
        var userToReturn = await userManager.Users.FirstOrDefaultAsync(x => x.Email == user.GetEmail());

        if (userToReturn is null)
            throw new AuthenticationException("User not found");

        return userToReturn;
    }

    public static async Task<UserAppIdentity> GetUserByEmailWithAddress(
        this UserManager<UserAppIdentity> userManager, ClaimsPrincipal user)
    {
        var userToReturn = await userManager.Users
            .Include(x => x.Address)
            .FirstOrDefaultAsync(x => x.Email == user.GetEmail());

        if (userToReturn is null)
            throw new AuthenticationException("User not found");

        return userToReturn;
    }


    public static string GetEmail(this ClaimsPrincipal user)
    { 
        var email = user.FindFirstValue(ClaimTypes.Email) 
            ?? throw new AuthenticationException("E-mail  claim not found");

        return email;
    }
}
