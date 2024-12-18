import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../../core/services/cart.service';
import { EmptyStateComponent } from '../../shared/components/empty-state/empty-state.component';
import { OrderSummaryComponent } from "../../shared/components/order-summary/order-summary.component";
import { CartItemComponent } from "./cart-item/cart-item.component";

@Component({
  selector: 'app-cart',
  imports: [
    CartItemComponent,
    EmptyStateComponent,
    OrderSummaryComponent
  ],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.scss'
})

export class CartComponent {
  private router = inject(Router);
  public cartService = inject(CartService);

  onAction() {
    this.router.navigateByUrl("/catalog");
  }
}
