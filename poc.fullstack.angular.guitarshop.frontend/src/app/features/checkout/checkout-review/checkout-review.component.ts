import { CurrencyPipe } from '@angular/common';
import { Component, inject, Input } from '@angular/core';
import { ConfirmationToken } from '@stripe/stripe-js';
import { environment } from '../../../../environments/environment';
import { CartService } from '../../../core/services/cart.service';
import { AddressPipe } from '../../../shared/pipes/address.pipe';
import { PaymentPipe } from '../../../shared/pipes/payment.pipe';

@Component({
  selector: 'app-checkout-review',
  imports: [
    CurrencyPipe,
    AddressPipe,
    PaymentPipe
  ],
  templateUrl: './checkout-review.component.html',
  styleUrl: './checkout-review.component.scss'
})

export class CheckoutReviewComponent {
  public cartService = inject(CartService);
  public productImagePath = environment.imageProductPath;  
  @Input() confirmationToken?: ConfirmationToken;
}
