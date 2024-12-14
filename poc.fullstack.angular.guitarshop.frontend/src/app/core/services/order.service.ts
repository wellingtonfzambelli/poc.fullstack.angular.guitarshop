import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Order } from '@stripe/stripe-js';
import { environment } from '../../../environments/environment';
import { OrderToCreate } from '../../shared/models/Order';

@Injectable({
  providedIn: 'root'
})

export class OrderService {
  public baseUrl = environment.baseUrlGuitarshop;
  private http = inject(HttpClient);

  public createOrder(orderToCreate: OrderToCreate) {
    return this.http.post<Order>(this.baseUrl + 'orders', orderToCreate);
  }

  public getOrdersForUser() {
    return this.http.get<Order>(this.baseUrl + 'orders');
  }

  public getOrderDetailed(id: number) {
    return this.http.get<Order>(this.baseUrl + 'orders/' + id);
  }
}