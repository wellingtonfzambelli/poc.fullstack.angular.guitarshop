import { Component, inject, Input, ɵINPUT_SIGNAL_BRAND_WRITE_TYPE } from '@angular/core';
import { CartService } from '../../../core/services/cart.service';
import { CurrencyPipe } from '@angular/common';
import { environment } from '../../../../environments/environment';
import { ConfirmationToken } from '@stripe/stripe-js';
import { AddressPipe } from '../../../shared/pipes/address.pipe';

@Component({
  selector: 'app-checkout-review',
  imports: [
    CurrencyPipe,
    AddressPipe
  ],
  templateUrl: './checkout-review.component.html',
  styleUrl: './checkout-review.component.scss'
})

export class CheckoutReviewComponent {
  public cartService = inject(CartService);
  public productImagePath = environment.imageProductPath;  
  @Input() confirmationToken?: ConfirmationToken;
}
