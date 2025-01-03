import { HttpClient } from '@angular/common/http';
import { computed, inject, Injectable, signal } from '@angular/core';
import { map } from 'rxjs';
import { environment } from '../../../environments/environment';
import { Cart, CartItem } from '../../shared/models/Cart';
import { DeliveryMethod } from '../../shared/models/DeliveryMethod';
import { Product } from '../../shared/models/Product';
import { SnackbarService } from './snackbar.service';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private http = inject(HttpClient);
  private snackbarService = inject(SnackbarService);

  public baseUrl = environment.baseUrlGuitarshop;
  public cartSignal = signal<Cart | null>(null);
  public selectedDelivery = signal<DeliveryMethod | null>(null);
  
  public getItemCount = computed(() => {
    return this.cartSignal()?.items.reduce((sum, item) => sum + item.quantity, 0);
  })

  public getTotals = computed(() => {
    const cart = this.cartSignal();
    const delivery = this.selectedDelivery();

    if(!cart)
      return null;

    const subtotal = cart.items.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const shipping = delivery ? delivery.price : 0;
    const discount = 0;

    return {
      subtotal,
      shipping,
      discount,
      total: subtotal + shipping - discount
    }
  })
 
  public getCart(id: string) {
    return this.http.get<Cart>(this.baseUrl + 'cart?id=' + id).pipe(
      map(cart => {
        this.cartSignal.set(cart);
        return this.cartSignal;
      })
    )
  }
  
  public setCart(cart: Cart) {
    return this.http.post<Cart>(this.baseUrl + 'cart', cart).subscribe({
      next: cart => this.cartSignal.set(cart)
    })
  }

  public addItemtoCart(item: CartItem | Product, quantity = 1) {
    const cart = this.cartSignal() ?? this.createCart();
    
    if(this.isProduct(item)){
      item = this.mapProductToCartItem(item);
    }

    cart.items = this.addOrUpdateItem(cart.items, item, quantity);
    this.setCart(cart);
  }

  public removeItemFromCart(productId: string, quantity = 1) {
    const cart = this.cartSignal();
    
    if(!cart)
      return;

    const index = cart.items.findIndex(x => x.productId === productId);
    if(index !== -1){
      if(cart.items[index].quantity > quantity){
        cart.items[index].quantity -= quantity;
      } else {
        cart.items.splice(index, 1);
      }

      if(cart.items.length === 0){
        this.deleteCart();
      }else{
        this.setCart(cart);
      }
    }

    this.snackbarService.success("Product removed from the cart");
  }

  public deleteCart() {
    this.http.delete(this.baseUrl + 'cart?id=' + this.cartSignal()?.id).subscribe({
      next: () =>{
        localStorage.removeItem('cart_id');
        this.cartSignal.set(null);
      }
    })
  }

  private mapProductToCartItem(item: Product): CartItem {
    return {
      productId: item.id,
      productName: item.name,
      price: item.price,
      quantity: 0,
      pictureUrl: item.pictureUrl,
      brand: item.brand,
      type: item.type
    }
  }
  
  private addOrUpdateItem(items: CartItem[], item: CartItem, quantity: number): CartItem[] {
    const index = items.findIndex(x => x.productId === item.productId);

    if(index === -1) {
      item.quantity = quantity;
      items.push(item);
    }else{
      items[index].quantity += quantity;
    }

    this.snackbarService.success("Product added to the cart");

    return items;
  }


  private isProduct(item: CartItem | Product): item is Product {
    return (item as Product).id !== undefined;
  }

  private createCart() : Cart{
    const cart = new Cart();
    localStorage.setItem('cart_id', cart.id);

    return cart;
  }
}
