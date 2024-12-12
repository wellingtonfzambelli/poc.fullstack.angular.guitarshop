import { inject, Injectable } from '@angular/core';
import {loadStripe, Stripe, StripeAddressElement, StripeAddressElementOptions, StripeElements, StripePaymentElement} from '@stripe/stripe-js';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { CartService } from './cart.service';
import { Cart } from '../../shared/models/Cart';
import { firstValueFrom, map } from 'rxjs';
import { AccountService } from './account.service';

@Injectable({
  providedIn: 'root'
})

export class StripeService {
  private stripePromise?: Promise<Stripe | null>;
  private elements?: StripeElements; 
  private cartService = inject(CartService);
  private accountService = inject(AccountService);
  private http = inject(HttpClient);
  private addressElement?: StripeAddressElement;
  private paymentElement?: StripePaymentElement;

  public baseUrl = environment.baseUrlGuitarshop;

  constructor() {
    this.stripePromise = loadStripe(environment.stripePublicKey);
  }

  public getStripeInstance() {
    return this.stripePromise;
  }

  public async initializeElements() {
    if(!this.elements) {
      const stripe = await this.getStripeInstance();

      if(stripe){
        const cart = await firstValueFrom(this.createOrUpdatePaymentIntent());
        this.elements = stripe.elements({clientSecret: cart.clientSecret, appearance: {labels: 'floating'}})
      }else{
        throw new Error('Stripe has not been loaded');
      }
    }

    return this.elements;
  }

  public async createPaymentElement() {
    if(!this.paymentElement) {
      const elements = await this.initializeElements();
      if(elements){
        this.paymentElement = elements.create('payment');
      } else {
        throw new Error('Elements instance has not been initialized');
      }
    }

    return this.paymentElement;
  }

  public async createAddressElement() {
    if(!this.addressElement) {
      const elements = await this.initializeElements();

      if(elements) {
        const user = this.accountService.currentUser();
        let defaultValue: StripeAddressElementOptions['defaultValues'] = {};

        if(user) {
          defaultValue.name = user.firtName + ' ' + user.lastName;
        }

        if(user?.address) {
          defaultValue.address = {
            line1: user.address.line1,
            line2: user.address.line2,
            city: user.address.city,
            state: user.address.state,
            country: user.address.country,
            postal_code: user.address.postalCode
          }
        }

        const options: StripeAddressElementOptions = {
          mode: 'shipping'
        };

        this.addressElement = elements.create('address', options);
      }else {
        throw new Error('Elements instance has not been loaded')
      }
    }

    return this.addressElement;
  }

  public async createConfirmationToken() {
    const stripe = await this.getStripeInstance();
    const elements = await this.initializeElements();
    const result = await elements.submit();

    if(result.error)
      throw new Error(result.error.message);

    if(stripe)
      return await stripe.createConfirmationToken({elements});
    else
      throw new Error('Stripe not availabe');
  }

  public createOrUpdatePaymentIntent() {
      const cart = this.cartService.cart();

      if(!cart)
        throw new Error('Problem with cart');

      return this.http.post<Cart>(this.baseUrl + 'payment/' + cart.id, {}).pipe(
        map(cart => {
          this.cartService.setCart(cart);
          return cart;
        })
      )
  }

  public disposeElements() {
    this.elements = undefined;
    this.addressElement = undefined;
    this.paymentElement = undefined;
  }
}