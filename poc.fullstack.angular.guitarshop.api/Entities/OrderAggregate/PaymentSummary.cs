namespace poc.fullstack.angular.guitarshop.api.Entities.OrderAggregate;

public sealed class PaymentSummary
{
    public int Last4 { get; set; }
    public required string Brand { get; set; }
    public int ExpMonth { get; set; }
    public int ExpYear { get; set; }
}