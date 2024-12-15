import { StepperSelectionEvent } from '@angular/cdk/stepper';
import { CurrencyPipe } from '@angular/common';
import { Component, inject, OnDestroy, OnInit, signal } from '@angular/core';
import { MatButton } from '@angular/material/button';
import {
  MatCheckboxChange,
  MatCheckboxModule,
} from '@angular/material/checkbox';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatStepper, MatStepperModule } from '@angular/material/stepper';
import { Router, RouterLink } from '@angular/router';
import {
  ConfirmationToken,
  StripeAddressElement,
  StripeAddressElementChangeEvent,
  StripePaymentElement,
  StripePaymentElementChangeEvent,
} from '@stripe/stripe-js';
import { firstValueFrom } from 'rxjs';
import { AccountService } from '../../core/services/account.service';
import { CartService } from '../../core/services/cart.service';
import { OrderService } from '../../core/services/order.service';
import { SnackbarService } from '../../core/services/snackbar.service';
import { StripeService } from '../../core/services/stripe.service';
import { OrderSummaryComponent } from '../../shared/components/order-summary/order-summary.component';
import { OrderToCreate, ShippingAddress } from '../../shared/models/Order';
import { Address } from '../../shared/models/User';
import { CheckoutDeliveryComponent } from './checkout-delivery/checkout-delivery.component';
import { CheckoutReviewComponent } from './checkout-review/checkout-review.component';

@Component({
  selector: 'app-checkout',
  standalone: true,
  imports: [
    OrderSummaryComponent,
    MatStepperModule,
    RouterLink,
    MatButton,
    MatCheckboxModule,
    CheckoutDeliveryComponent,
    CheckoutReviewComponent,
    CurrencyPipe,
    MatProgressSpinnerModule,
  ],
  templateUrl: './checkout.component.html',
  styleUrl: './checkout.component.scss',
})
export class CheckoutComponent implements OnInit, OnDestroy {
  private stripeService = inject(StripeService);
  private snackbar = inject(SnackbarService);
  private accountService = inject(AccountService);
  private orderService = inject(OrderService);
  private router = inject(Router);

  public cartService = inject(CartService);
  public addressElement?: StripeAddressElement;
  public paymentElement?: StripePaymentElement;
  public saveAddress = false;
  public confirmationToken?: ConfirmationToken;
  public loading = false;
  public signalCompletionSteps = signal<{
    address: boolean;
    card: boolean;
    delivery: boolean;
  }>({
    address: false,
    card: false,
    delivery: false,
  });

  public async ngOnInit() {
    try {
      this.addressElement = await this.stripeService.createAddressElement();
      this.addressElement.mount('#address-element');
      this.addressElement.on('change', this.handleAddressChange);

      this.paymentElement = await this.stripeService.createPaymentElement();
      this.paymentElement.mount('#payment-element');
      this.paymentElement.on('change', this.handlePaymentChange);
    } catch (error: any) {
      this.snackbar.error(error.message);
    }
  }

  public async confirmPayment(stepper: MatStepper) {
    this.loading = true;
    
    try {
      if (this.confirmationToken) {

        const result = await this.stripeService.confirmPayment(
          this.confirmationToken
        );

        if (result.paymentIntent?.status === 'succeeded') {
          const order = await this.createOrderModel();
          const orderResult = await firstValueFrom(
            this.orderService.createOrder(order)
          );

          if (orderResult) {
            this.cartService.deleteCart();
            this.cartService.selectedDelivery.set(null);
            this.router.navigateByUrl('/checkout/success');
          } else {
            throw new Error('Order creating failed');
          }
        } else if (result.error) {
          throw new Error(result.error.message);
        } else {
          throw new Error('Something went wrong');
        }
      }
    } catch (error: any) {
      this.snackbar.error(error.message || 'Something went wrong');
      stepper.previous();
    } finally {
      this.loading = false;
    }
  }

  public handleAddressChange = (event: StripeAddressElementChangeEvent) => {
    this.signalCompletionSteps.update((state) => {
      state.address = event.complete;
      return state;
    });
  };

  public handlePaymentChange = (event: StripePaymentElementChangeEvent) => {
    this.signalCompletionSteps.update((state) => {
      state.card = event.complete;
      return state;
    });
  };

  public handleDeliveryChange(event: boolean) {
    this.signalCompletionSteps.update((state) => {
      state.delivery = event;
      return state;
    });
  }

  public async getConfirmationToken() {
    try {
      if (
        Object.values(this.signalCompletionSteps()).every(
          (status) => status === true
        )
      ) {
        const result = await this.stripeService.createConfirmationToken();

        if (result.error) throw new Error(result.error.message);

        this.confirmationToken = result.confirmationToken;
        console.log(this.confirmationToken);
      }
    } catch (error: any) {
      this.snackbar.error(error.message);
    }
  }

  public async onStepChange(event: StepperSelectionEvent) {
    if (event.selectedIndex === 1) {
      if (this.saveAddress) {
        const address = (await this.getAddressFromStripeAddress()) as Address;
        address && firstValueFrom(this.accountService.updateAddress(address));
      }
    }

    if (event.selectedIndex === 2) {
      await firstValueFrom(this.stripeService.createOrUpdatePaymentIntent());
    }

    if (event.selectedIndex === 3) {
      await this.getConfirmationToken();
    }
  }

  public onSaveAddressCheckboxChange(event: MatCheckboxChange) {
    this.saveAddress = event.checked;
  }

  private async createOrderModel(): Promise<OrderToCreate> {
    debugger
    const cart = this.cartService.cartSignal();
    const shippingAddress = (await this.getAddressFromStripeAddress()) as ShippingAddress;
    const card = this.confirmationToken?.payment_method_preview.card;

    if (!cart?.id || !cart.deliveryMethodId || !card || !shippingAddress) {
      throw new Error('Problem creating order');
    }

    const order: OrderToCreate = {
      cartId: cart.id,
      paymentSummary: {
        last4: +card.last4,
        brand: card.brand,
        expMonth: card.exp_month,
        expYear: card.exp_year,
      },
      deliveryMethodId: cart.deliveryMethodId,
      shippingAddress,
    };

    return order;
  }

  private async getAddressFromStripeAddress(): Promise<Address | ShippingAddress | null> {
    const result = await this.addressElement?.getValue();
    const address = result?.value.address;

    if (address) {
      return {
        name: result.value.name,
        line1: address.line1,
        line2: address.line2 || undefined,
        city: address.city,
        country: address.country,
        state: address.state,
        postalCode: address.postal_code,
      };
    } else {
      return null;
    }
  }

  ngOnDestroy(): void {
    this.stripeService.disposeElements();
  }
}