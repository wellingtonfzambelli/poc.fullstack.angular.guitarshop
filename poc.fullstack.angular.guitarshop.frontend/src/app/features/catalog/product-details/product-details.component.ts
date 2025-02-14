import { CurrencyPipe } from '@angular/common';
import { Component, input, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MatButton } from '@angular/material/button';
import { MatDivider } from '@angular/material/divider';
import { MatFormField, MatLabel } from '@angular/material/form-field';
import { MatIcon } from '@angular/material/icon';
import { MatInput } from '@angular/material/input';
import { ActivatedRoute } from '@angular/router';
import { environment } from '../../../../environments/environment';
import { CartService } from '../../../core/services/cart.service';
import { CatalogService } from '../../../core/services/catalog.service';
import { CartItem } from '../../../shared/models/Cart';
import { Product } from '../../../shared/models/Product';

@Component({
  selector: 'app-product-details',
  imports: [
    CurrencyPipe,
    MatButton,
    MatIcon,
    MatFormField,
    MatInput,
    MatLabel,
    MatDivider,
    FormsModule
  ],
  templateUrl: './product-details.component.html',
  styleUrl: './product-details.component.scss'
})
export class ProductDetailsComponent implements OnInit {
  // get from querystring

  public product?: Product;
  public item = input.required<CartItem>();
  public quantityInCart: number = 0;
  public quantityInitial = 0;
  public productImagePath = environment.imageProductPath;  

  constructor
  (
    private guitarShopService:CatalogService, 
    private activeRoute: ActivatedRoute,
    public cartService: CartService
  ) { }

  ngOnInit(): void {
   this.loadProduct();
  }

  public loadProduct() {
    const id = this.activeRoute.snapshot.paramMap.get('id');
    
    if(!id)
      return;

    this.guitarShopService.getProductById(id).subscribe({
      next: response => {
        this.product = response;
        this.updateQuantityInCart();
      },
      error: error => console.log(error)
    })
  }

  public updateQuantityInCart() {
    this.quantityInCart = this.cartService.cartSignal()?.items
      .find(x => x.productId === this.product?.id)?.quantity || 0

    this.quantityInitial = this.quantityInCart || 1;
  }

  public updateCart() {
    if(!this.product)
      return;

    if(this.quantityInitial > this.quantityInCart){
      const itemsToAdd = this.quantityInitial - this.quantityInCart;

      this.quantityInCart += itemsToAdd;
      this.cartService.addItemtoCart(this.product, itemsToAdd);
    }else{
      const itemsToRemove = this.quantityInCart - this.quantityInitial;
      this.quantityInCart -= itemsToRemove;
      this.cartService.removeItemFromCart(this.product.id, itemsToRemove);
    }
  }

  public changeButtonText() {
    return this.quantityInCart > 0 ? 'Update cart' : 'update cart';
  }
}