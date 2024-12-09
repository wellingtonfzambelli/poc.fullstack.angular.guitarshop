import { Component, OnInit } from '@angular/core';
import { CatalogService } from '../../core/services/catalog.service';
import { Product } from '../../shared/models/Product';
import { ProductItemComponent } from "./product-item/product-item.component";
import { MatDialog } from '@angular/material/dialog';
import { FiltersDialogComponent } from './filters-dialog/filters-dialog.component';
import { MatButton } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { MatMenu, MatMenuTrigger } from '@angular/material/menu';
import { MatListOption, MatSelectionList, MatSelectionListChange } from '@angular/material/list';
import { CatalogFilterRequest } from '../../shared/models/CatalogFilterRequest';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { Pagination } from '../../shared/models/Pagination';
import { FormsModule, FormSubmittedEvent } from '@angular/forms';

@Component({
  selector: 'app-shop',
  imports: [    
    ProductItemComponent,
    MatButton,
    MatIcon,
    MatMenu,
    MatSelectionList,
    MatListOption,
    MatMenuTrigger,
    MatPaginator,
    FormsModule
],
  templateUrl: './catalog.component.html',
  styleUrl: './catalog.component.scss'
})
export class CatalogComponent implements OnInit {
  public pagination?: Pagination<Product>;
  public catalogFilterRequest = new CatalogFilterRequest();
  public pageSizeOptions = [5,10,15,20];
  
  public sortOptions = [
    {name: 'Alphabetical', value: 'name'},
    {name: 'Price: Low-High', value: 'priceAsc'},
    {name: 'Price: High-Low', value: 'priceDesc'},
  ];
  
  constructor(private guitarShopService:CatalogService, private dialogService:MatDialog) {

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
    this.guitarShopService.getProducts(this.catalogFilterRequest).subscribe({
      next: response => this.pagination = response,
      error: error => console.log(error)
      //,complete: () => console.log(this.pagination)
    })  
  }

  openFiltersDialog() {
    const dialogRef = this.dialogService.open(FiltersDialogComponent, {
      minWidth: '500px',
      data: {
        selectedBrands: this.catalogFilterRequest.brands,
        selectedTypes: this.catalogFilterRequest.types
      }
    });
    
    dialogRef.afterClosed().subscribe({
      next: result => {
        if(result){
          this.catalogFilterRequest.brands = result.selectedBrands;
          this.catalogFilterRequest.types = result.selectedTypes;
          this.catalogFilterRequest.pageNumber = 1;
          this.getProducts();
        }
      }
    })
  }

  onSortChange(event: MatSelectionListChange) {
    const selectedOption = event.options[0];    

    if(selectedOption) {
      this.catalogFilterRequest.orderBy = selectedOption.value;
      this.catalogFilterRequest.pageNumber = 1;
      this.getProducts();
    }
  }

  onSearchChange() {
    this.catalogFilterRequest.pageNumber = 1;
    this.getProducts();
  }

  handlePaginationEvent(event: PageEvent) {
    this.catalogFilterRequest.pageNumber = event.pageIndex + 1;
    this.catalogFilterRequest.pageSize = event.pageSize;
    this.getProducts();
  }
}