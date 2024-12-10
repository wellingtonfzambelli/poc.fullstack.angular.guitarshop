import { Component } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-cart-empty',
  imports: [
    MatIcon,
    MatButton,
    RouterLink
  ],
  templateUrl: './cart-empty.component.html',
  styleUrl: './cart-empty.component.scss'
})
export class CartEmptyComponent {

}
