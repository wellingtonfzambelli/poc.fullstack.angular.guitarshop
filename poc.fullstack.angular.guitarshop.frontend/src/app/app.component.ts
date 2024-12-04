import { Component, inject, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from "./layout/header/header.component";
import { ShopService } from './core/services/shop.service';
import { Product } from './shared/models/Product';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, HeaderComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent  implements OnInit {
  title = 'GuitarShop';
  products: Product[] = [];

  constructor(private guitarShopService:ShopService) {

  }
  
  ngOnInit(): void {
    this.guitarShopService.getProducts().subscribe({
      next: response => this.products = response.data,
      error: error => console.log(error)
      //complete: () => console.log('complete')
    })
  }
}
