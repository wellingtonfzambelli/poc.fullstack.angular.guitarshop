import { inject, Injectable } from '@angular/core';
import { Pagination } from '../../shared/models/Pagination';
import { Product } from '../../shared/models/Product';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class ShopService {
  private baseUrlGuitarShop = 'https://localhost:6001/api/v1/'
  public types: string[] = [];
  public brands: string[] = [];

  constructor(private http:HttpClient) {

  }
  
  getProducts() {
    return this.http.get<Pagination<Product>>(this.baseUrlGuitarShop + 'product?pageSize=10')
  }

  getTypes() {
    if(this.types.length > 0) 
      return;

    return this.http.get<string[]>(this.baseUrlGuitarShop + 'product/types').subscribe({
      next: response => this.types = response
    })
  }

  getBrands() {
    if(this.brands.length > 0)
      return;

    return this.http.get<string[]>(this.baseUrlGuitarShop + 'product/brands').subscribe({
      next: response => this.brands = response
    })
  }
}