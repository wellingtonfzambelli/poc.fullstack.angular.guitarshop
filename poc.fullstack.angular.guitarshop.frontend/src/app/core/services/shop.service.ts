import { inject, Injectable } from '@angular/core';
import { Pagination } from '../../shared/models/Pagination';
import { Product } from '../../shared/models/Product';
import { HttpClient, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class ShopService {
  private baseUrlGuitarShop = 'https://localhost:6001/api/v1/'
  public types: string[] = [];
  public brands: string[] = [];

  constructor(private http:HttpClient) {

  }
  
  getProducts(brands?: string[], types?: string[], sort?: string ) {
    let params = new HttpParams();

    params = params.append('pageSize', 10);

    if(brands && brands.length > 0)
      params = params.append('brands', brands.join(','));

    if(types && types.length > 0)
      params = params.append('types', types.join(','));

    if(sort) {
      params = params.append('orderBy', sort);
    }

    return this.http.get<Pagination<Product>>(this.baseUrlGuitarShop + 'product', {params})
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