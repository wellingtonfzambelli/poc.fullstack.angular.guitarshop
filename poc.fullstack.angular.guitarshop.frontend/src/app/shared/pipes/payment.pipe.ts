import { Pipe, PipeTransform } from '@angular/core';
import { ConfirmationToken } from '@stripe/stripe-js';

@Pipe({
  name: 'payment',
  standalone: true
})
export class PaymentPipe implements PipeTransform {

  transform(value?: ConfirmationToken['payment_method_preview'], ...args: unknown[]): unknown {
    console.log(value?.card)
    if(value?.card) {
      const {brand, exp_month, exp_year, funding, last4} = value.card;
      return `${brand.toUpperCase()} - ${funding}, **** **** **** ${last4}, Exp: ${exp_month}/${exp_year}`;
    } else {
      return 'Unknown card';
    }

    return null;
  }

}
