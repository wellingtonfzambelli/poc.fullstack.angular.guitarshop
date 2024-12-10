import { Component, inject, input } from '@angular/core';
import { CartItem } from '../../../shared/models/Cart';
import { RouterLink } from '@angular/router';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { CurrencyPipe } from '@angular/common';
import { environment } from '../../../../environments/environment';
import { CartService } from '../../../core/services/cart.service';

@Component({
  selector: 'app-cart-item',
  imports: [
    RouterLink,
    MatButton,
    MatIcon,
    CurrencyPipe
  ],
  templateUrl: './cart-item.component.html',
  styleUrl: './cart-item.component.scss'
})

export class CartItemComponent {
  public item = input.required<CartItem>();
  public productImagePath = environment.imageProductPath;

  public cartService = inject(CartService);

  public incrementQuantity() {
    this.cartService.addItemtoCart(this.item());
  }

  public decrementQuantity() {
    this.cartService.removeItemFromCart(this.item().productId);
  }

  public removeItemFromCart() {
    this.cartService.removeItemFromCart(this.item().productId, this.item().quantity);
  }
}
