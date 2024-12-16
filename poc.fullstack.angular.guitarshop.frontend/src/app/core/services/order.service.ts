import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { Order, OrderToCreate } from '../../shared/models/Order';

@Injectable({
  providedIn: 'root'
})

export class OrderService {
  public baseUrl = environment.baseUrlGuitarshop;
  private http = inject(HttpClient);

  public createOrder(orderToCreate: OrderToCreate) {
    return this.http.post<Order>(this.baseUrl + 'order', orderToCreate);
  }

  public getOrdersForUser() {
    return this.http.get<Order[]>(this.baseUrl + 'order');
  }

  public getOrderDetailed(id: string) {
    return this.http.get<Order>(this.baseUrl + 'order/' + id);
  }
}