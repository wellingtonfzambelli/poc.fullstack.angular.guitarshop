import { Component, OnInit } from '@angular/core';
import { Product } from '../../../shared/models/Product';
import { GuitarShopService } from '../../../core/services/guitar-shop.service';
import { ActivatedRoute } from '@angular/router';
import { CurrencyPipe } from '@angular/common';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { MatFormField, MatLabel } from '@angular/material/form-field';
import { MatInput } from '@angular/material/input';
import { MatDivider } from '@angular/material/divider';

@Component({
  selector: 'app-product-details',
  imports: [
    CurrencyPipe,
    MatButton,
    MatIcon,
    MatFormField,
    MatInput,
    MatLabel,
    MatDivider
  ],
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
