import { Component, inject } from '@angular/core';
import { CatalogService } from '../../../core/services/catalog.service';
import { MatDivider } from '@angular/material/divider';
import { MatListOption, MatSelectionList } from '@angular/material/list';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatButton } from '@angular/material/button';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-filters-dialog',
  imports: [
    MatDivider,
    MatSelectionList,
    MatListOption,
    MatButton,
    FormsModule
  ],
  templateUrl: './filters-dialog.component.html',
  styleUrl: './filters-dialog.component.scss'
})

export class FiltersDialogComponent {  
  
  private data = inject(MAT_DIALOG_DATA);
  public selectedBrands: string[] = this.data.selectedBrands;
  public selectedTypes: string[] = this.data.selectedTypes;

  constructor(
    public guitarShopService: CatalogService, 
    private dialogRef: MatDialogRef<FiltersDialogComponent>
  ) 
  { }

  applyFilters(){
    this.dialogRef.close({
      selectedBrands: this.selectedBrands,
      selectedTypes: this.selectedTypes
    });
  }
}