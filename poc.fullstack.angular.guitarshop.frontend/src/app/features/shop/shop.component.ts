import { Component, OnInit } from '@angular/core';
import { ShopService } from '../../core/services/shop.service';
import { Product } from '../../shared/models/Product';
import { MatCard } from '@angular/material/card';
import { ProductItemComponent } from "./product-item/product-item.component";
import { MatDialog } from '@angular/material/dialog';
import { FiltersDialogComponent } from './filters-dialog/filters-dialog.component';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-shop',
  imports: [
    MatCard,
    ProductItemComponent,
    MatButton,
    MatIcon
],
  templateUrl: './shop.component.html',
  styleUrl: './shop.component.scss'
})
export class ShopComponent implements OnInit {
  public products: Product[] = [];

  constructor(private guitarShopService:ShopService, private dialogService:MatDialog) {

  }

  ngOnInit(): void {
    this.initializeCatalog();
  }

  initializeCatalog() {
    this.guitarShopService.getBrands();
    
    this.guitarShopService.getTypes();
    
    this.guitarShopService.getProducts().subscribe({
      next: response => this.products = response.data,
      error: error => console.log(error)
      //complete: () => console.log('complete')
    })  
  }

  openFiltersDialog() {
    const dialogRef = this.dialogService.open(FiltersDialogComponent, {
      minWidth: '500px'
    })
  }
}