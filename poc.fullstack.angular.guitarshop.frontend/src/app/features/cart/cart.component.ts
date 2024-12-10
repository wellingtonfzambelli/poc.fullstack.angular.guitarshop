import { Component, inject } from '@angular/core';
import { CartService } from '../../core/services/cart.service';
import { CartItemComponent } from "./cart-item/cart-item.component";
import { OrderSummaryComponent } from "../../shared/components/order-summary/order-summary.component";
import { CartEmptyComponent } from './cart-empty/cart-empty.component';

@Component({
  selector: 'app-cart',
  imports: [
    CartItemComponent, 
    OrderSummaryComponent,
    CartEmptyComponent
  ],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.scss'
})

export class CartComponent {
  cartService = inject(CartService);
}
