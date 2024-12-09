﻿using poc.fullstack.angular.guitarshop.api.Entities.Base;
using System.ComponentModel.DataAnnotations;

namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class Address : BaseEntity
{
    [Required]
    public string Line1 { get; set; }
    public string Line2 { get; set; }

    [Required]
    public string City { get; set; }

    [Required]
    public string State { get; set; }

    [Required]
    public string PostalCode { get; set; }

    [Required]
    public string Country { get; set; }
}