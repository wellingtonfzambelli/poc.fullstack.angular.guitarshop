﻿namespace poc.fullstack.angular.guitarshop.api.Entities;

public sealed class CartItem
{
    public string ProductId { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public required string ProductName { get; set; }
    public required string PictureUrl { get; set; }
    public required string Brand { get; set; }
    public required string Type { get; set; }
}