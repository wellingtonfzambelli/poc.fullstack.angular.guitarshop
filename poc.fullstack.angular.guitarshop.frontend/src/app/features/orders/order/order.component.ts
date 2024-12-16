import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { OrderService } from '../../../core/services/order.service';
import { Order } from '../../../shared/models/Order';

@Component({
  selector: 'app-order',
  standalone: true,
  imports: [
    RouterLink,
    DatePipe,
    CurrencyPipe
  ],
  templateUrl: './order.component.html',
  styleUrl: './order.component.scss'
})

export class OrderComponent implements OnInit {

  private orderService = inject(OrderService);
  public orders: Order[] = [];

  ngOnInit(): void {
    this.orderService.getOrdersForUser().subscribe({
      next: ordersResponse => this.orders = ordersResponse
    })
  }
}