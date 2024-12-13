import { CurrencyPipe } from '@angular/common';
import { Component, inject, OnInit, output } from '@angular/core';
import { MatRadioModule } from '@angular/material/radio';
import { CartService } from '../../../core/services/cart.service';
import { CheckoutService } from '../../../core/services/checkout.service';
import { DeliveryMethod } from '../../../shared/models/DeliveryMethod';

@Component({
  selector: 'app-checkout-delivery',
  imports: [
    MatRadioModule,
    CurrencyPipe
  ],
  templateUrl: './checkout-delivery.component.html',
  styleUrl: './checkout-delivery.component.scss'
})

export class CheckoutDeliveryComponent implements OnInit {
  public checkoutService = inject(CheckoutService);
  public cartService = inject(CartService);
  public deliveryComplete = output<boolean>();

  ngOnInit(): void {
    this.checkoutService.getDeliveryMethods().subscribe({
      next: methods => {
        if(this.cartService.cartSignal()?.deliveryMethodId){
          const method = methods.find(x => x.id === this.cartService.cartSignal()?.deliveryMethodId);

          if(method) {
            this.cartService.selectedDelivery.set(method);
            this.deliveryComplete.emit(true);
          }
        }
      }
    });
  }

  public updateDeliveryMethod(method: DeliveryMethod){
    this.cartService.selectedDelivery.set(method);
    
    const cart = this.cartService.cartSignal();

    if(cart) {
      cart.deliveryMethodId == method.id;
      this.cartService.setCart(cart);
      this.deliveryComplete.emit(true);
    }
  }
}
