import { Component, inject, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from "./layout/header/header.component";
import { ShopComponent } from "./features/shop/shop.component";

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, HeaderComponent, ShopComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'GuitarShop';

}