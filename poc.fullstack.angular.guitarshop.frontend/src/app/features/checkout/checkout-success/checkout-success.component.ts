import { CurrencyPipe, DatePipe, NgIf } from '@angular/common';
import { Component, inject, OnDestroy } from '@angular/core';
import { MatButton } from '@angular/material/button';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { RouterLink } from '@angular/router';
import { OrderService } from '../../../core/services/order.service';
import { SignalrService } from '../../../core/services/signalr.service';
import { AddressPipe } from '../../../shared/pipes/address.pipe';
import { PaymentPipe } from '../../../shared/pipes/payment.pipe';

@Component({
  selector: 'app-checkout-success',
  imports: [
    RouterLink,
    MatButton,
    CurrencyPipe,
    AddressPipe,
    PaymentPipe,
    DatePipe,
    MatProgressSpinnerModule,
    NgIf
  ],
  templateUrl: './checkout-success.component.html',
  styleUrl: './checkout-success.component.scss'
})

export class CheckoutSuccessComponent implements OnDestroy {
  public signalrService = inject(SignalrService);
  private orderService = inject(OrderService);
  
  ngOnDestroy(): void {
    this.orderService.orderComplete = false;
    this.signalrService.orderSignal.set(null);
  }
}