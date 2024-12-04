import { inject, Injectable } from '@angular/core';
import { Pagination } from '../../shared/models/Pagination';
import { Product } from '../../shared/models/Product';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class ShopService {
  private baseUrlGuitarShop = 'https://localhost:6001/api/v1/'
  
  constructor(private http:HttpClient) {

  }
  
  getProducts() {
    return this.http.get<Pagination<Product>>(this.baseUrlGuitarShop + 'product')
  }
}
