import { Injectable } from '@angular/core';
import { Pagination } from '../../shared/models/Pagination';
import { Product } from '../../shared/models/Product';
import { HttpClient, HttpParams } from '@angular/common/http';
import { CatalogFilterRequest } from '../../shared/models/CatalogFilterRequest';

@Injectable({
  providedIn: 'root'
})

export class GuitarShopService {
  private baseUrlGuitarShop = 'https://localhost:6001/api/v1/'
  public types: string[] = [];
  public brands: string[] = [];

  constructor(private http:HttpClient) {

  }
  
  getProducts(shopFilterRequest: CatalogFilterRequest) {
    let params = new HttpParams();

    params = params.append('pageSize', 10);

    if(shopFilterRequest.brands.length > 0)
      params = params.append('brands', shopFilterRequest.brands.join(','));

    if(shopFilterRequest.types.length > 0)
      params = params.append('types', shopFilterRequest.types.join(','));

    if(shopFilterRequest.orderBy) {
      params = params.append('orderBy', shopFilterRequest.orderBy);
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