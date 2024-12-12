import { inject, Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { DeliveryMethod } from '../../shared/models/DeliveryMethod';
import { map, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class CheckoutService {
  private http = inject(HttpClient);
  public baseUrl = environment.baseUrlGuitarshop;
  public deliveryMethods: DeliveryMethod[] = [];
  
  getDeliveryMethods() {
    if(this.deliveryMethods.length > 0)
      return of(this.deliveryMethods);

    return this.http.get<DeliveryMethod[]>(this.baseUrl + 'payment/delivery-methods').pipe(
      map(methods => {
        this.deliveryMethods = methods.sort((a,b) => b.price - a.price);
        return methods;
      })
    )
  }
}