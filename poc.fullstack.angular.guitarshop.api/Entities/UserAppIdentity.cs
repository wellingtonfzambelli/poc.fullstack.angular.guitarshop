using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class UserAppIdentity : IdentityUser
{
    [Required]
    [MaxLength(30)]
    public string FirstName { get; set; }

    [Required]
    [MaxLength(30)]
    public string LastName { get; set; }

    public Address? Address { get; set; }
}