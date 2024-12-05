import { Component, OnInit } from '@angular/core';
import { GuitarShopService } from '../../core/services/shop.service';
import { Product } from '../../shared/models/Product';
import { ProductItemComponent } from "./product-item/product-item.component";
import { MatDialog } from '@angular/material/dialog';
import { FiltersDialogComponent } from './filters-dialog/filters-dialog.component';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { MatMenu, MatMenuTrigger } from '@angular/material/menu';
import { MatListOption, MatSelectionList, MatSelectionListChange } from '@angular/material/list';
import { CatalogFilterRequest } from '../../shared/models/CatalogFilterRequest';

@Component({
  selector: 'app-shop',
  imports: [    
    ProductItemComponent,
    MatButton,
    MatIcon,
    MatMenu,
    MatSelectionList,
    MatListOption,
    MatMenuTrigger
],
  templateUrl: './catalog.component.html',
  styleUrl: './catalog.component.scss'
})
export class CatalogComponent implements OnInit {
  public products: Product[] = [];
  public shopFilterRequest = new CatalogFilterRequest();
  
  public sortOptions = [
    {name: 'Alphabetical', value: 'name'},
    {name: 'Price: Low-High', value: 'priceAsc'},
    {name: 'Price: High-Low', value: 'priceDesc'},
  ];
  
  constructor(private guitarShopService:GuitarShopService, private dialogService:MatDialog) {

  }

  ngOnInit(): void {
    this.initializeCatalog();
  }

  initializeCatalog() {
    this.guitarShopService.getBrands();
    
    this.guitarShopService.getTypes();
    
    this.getProducts();
  }

  getProducts() {
    this.guitarShopService.getProducts(this.shopFilterRequest).subscribe({
      next: response => this.products = response.data,
      error: error => console.log(error)
      //complete: () => console.log('complete')
    })  
  }

  openFiltersDialog() {
    const dialogRef = this.dialogService.open(FiltersDialogComponent, {
      minWidth: '500px',
      data: {
        selectedBrands: this.shopFilterRequest.brands,
        selectedTypes: this.shopFilterRequest.types
      }
    });
    
    dialogRef.afterClosed().subscribe({
      next: result => {
        if(result){
          this.shopFilterRequest.brands = result.selectedBrands;
          this.shopFilterRequest.types = result.selectedTypes;
          this.getProducts();
        }
      }
    })
  }

  onSortChange(event: MatSelectionListChange) {
    const selectedOption = event.options[0];    

    if(selectedOption) {
      this.shopFilterRequest.orderBy = selectedOption.value;
      this.getProducts();
    }
  }
}