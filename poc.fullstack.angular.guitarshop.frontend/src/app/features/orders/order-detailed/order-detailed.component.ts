import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { ActivatedRoute } from '@angular/router';
import { environment } from '../../../../environments/environment';
import { OrderService } from '../../../core/services/order.service';
import { Order } from '../../../shared/models/Order';

@Component({
  selector: 'app-order-detailed',
  imports: [
    MatCardModule,
    MatButton,
    DatePipe,
    CurrencyPipe
  ],
  templateUrl: './order-detailed.component.html',
  styleUrl: './order-detailed.component.scss'
})

export class OrderDetailedComponent implements OnInit {  
  private orderService = inject(OrderService);
  private activatedRoute = inject(ActivatedRoute)

  public order?: Order;
  public productImagePath = environment.imageProductPath;  

  ngOnInit(): void {
    this.loadOrder();
  }

  loadOrder() {
    const id = this.activatedRoute.snapshot.paramMap.get('id');
    
    if(!id)
      return;

    this.orderService.getOrderDetailed(id).subscribe({
      next: order => this.order = order
    })
  }
}
