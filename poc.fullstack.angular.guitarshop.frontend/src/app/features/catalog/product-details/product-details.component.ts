import { Component, OnInit } from '@angular/core';
import { Product } from '../../../shared/models/Product';
import { GuitarShopService } from '../../../core/services/guitar-shop.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-product-details',
  imports: [],
  templateUrl: './product-details.component.html',
  styleUrl: './product-details.component.scss'
})
export class ProductDetailsComponent implements OnInit {
  // get from querystring

  public product?: Product;
  
  constructor(private guitarShopService:GuitarShopService, private activeRoute: ActivatedRoute) {

  }

  ngOnInit(): void {
   this.loadProduct();
  }

  loadProduct() {
    const id = this.activeRoute.snapshot.paramMap.get('id');
    
    if(!id)
      return;

    this.guitarShopService.getProductById(id).subscribe({
      next: response => this.product = response,
      error: error => console.log(error)
    })
  }
}
