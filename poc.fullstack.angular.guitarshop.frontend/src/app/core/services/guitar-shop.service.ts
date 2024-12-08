import { Injectable } from '@angular/core';
import { Pagination } from '../../shared/models/Pagination';
import { Product } from '../../shared/models/Product';
import { HttpClient, HttpParams } from '@angular/common/http';
import { CatalogFilterRequest } from '../../shared/models/CatalogFilterRequest';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})

export class GuitarShopService {
  private baseUrlGuitarShop = environment.baseUrlGuitarshop
  public types: string[] = [];
  public brands: string[] = [];

  constructor(private http:HttpClient) {

  }
  
  getProducts(catalogFilterRequest: CatalogFilterRequest) {
    let params = new HttpParams();

    params = params.append('pageSize', catalogFilterRequest.pageSize);
    params = params.append('pageNumber', catalogFilterRequest.pageNumber);

    if(catalogFilterRequest.brands.length > 0)
      params = params.append('brands', catalogFilterRequest.brands.join(','));

    if(catalogFilterRequest.types.length > 0)
      params = params.append('types', catalogFilterRequest.types.join(','));

    if(catalogFilterRequest.orderBy)
      params = params.append('orderBy', catalogFilterRequest.orderBy);

    if(catalogFilterRequest.searchTerm)
      params = params.append('searchTerm', catalogFilterRequest.searchTerm);

    return this.http.get<Pagination<Product>>(this.baseUrlGuitarShop + 'product', {params})
  }

  getProductById(id: string) {
    return this.http.get<Product>(this.baseUrlGuitarShop + 'product/' + id);
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