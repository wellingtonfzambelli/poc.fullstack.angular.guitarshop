import { Component, inject, OnInit } from '@angular/core';
import { HeaderComponent } from "./layout/header/header.component";
import { CatalogComponent } from "./features/catalog/catalog.component";

@Component({
  selector: 'app-root',
  imports: [HeaderComponent, CatalogComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'GuitarShop';

}