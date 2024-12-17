import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';
import { orderCompleteGuard } from './core/guards/order-complete.guard';
import { LoginComponent } from './features/account/login/login.component';
import { RegisterComponent } from './features/account/register/register.component';
import { CartComponent } from './features/cart/cart.component';
import { CatalogComponent } from './features/catalog/catalog.component';
import { ProductDetailsComponent } from './features/catalog/product-details/product-details.component';
import { CheckoutSuccessComponent } from './features/checkout/checkout-success/checkout-success.component';
import { CheckoutComponent } from './features/checkout/checkout.component';
import { ContactComponent } from './features/contact/contact.component';
import { HomeComponent } from './features/home/home.component';
import { OrderDetailedComponent } from './features/orders/order-detailed/order-detailed.component';
import { OrderComponent } from './features/orders/order/order.component';
import { TestErrorComponent } from './features/test-error/test-error.component';
import { NotFoundComponent } from './shared/components/not-found/not-found.component';
import { ServerErrorComponent } from './shared/components/server-error/server-error.component';

export const routes: Routes = [
    { path: '', component: HomeComponent },
    { path: 'catalog', component: CatalogComponent },
    { path: 'catalog/:id', component: ProductDetailsComponent },
    { path: 'cart', component: CartComponent },
    { path: 'checkout', component: CheckoutComponent, canActivate:[authGuard] },
    { path: 'checkout/success', component: CheckoutSuccessComponent, canActivate:[authGuard, orderCompleteGuard] },
    { path: 'orders', component: OrderComponent, canActivate: [authGuard] },
    { path: 'orders/:id', component: OrderDetailedComponent, canActivate: [authGuard] },
    { path: 'account/login', component: LoginComponent },
    { path: 'account/register', component: RegisterComponent },
    { path: 'contact', component: ContactComponent },
    
    { path: 'test-error', component: TestErrorComponent },
    { path: 'not-found', component: NotFoundComponent },
    { path: 'server-error', component: ServerErrorComponent },
    
    { path: '**', redirectTo: 'not-found', pathMatch: 'full' } // redirect to homepage
];