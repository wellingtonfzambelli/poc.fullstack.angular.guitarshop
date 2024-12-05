import { Routes } from '@angular/router';
import { HomeComponent } from './features/home/home.component';
import { CatalogComponent } from './features/catalog/catalog.component';
import { ProductDetailsComponent } from './features/catalog/product-details/product-details.component';
import { ContactComponent } from './features/contact/contact.component';
import { TestErrorComponent } from './features/test-error/test-error.component';

export const routes: Routes = [
    { path: '', component: HomeComponent },
    { path: 'catalog', component: CatalogComponent },
    { path: 'catalog/:id', component: ProductDetailsComponent },
    { path: 'contact', component: ContactComponent },
    { path: 'test-error', component: TestErrorComponent },
    { path: '**', redirectTo: '', pathMatch: 'full' } // redirect to homepage
];