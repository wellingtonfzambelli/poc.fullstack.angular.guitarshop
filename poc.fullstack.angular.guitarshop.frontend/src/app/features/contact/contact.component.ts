import { Component, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatError } from '@angular/material/form-field';
import { SnackbarService } from '../../core/services/snackbar.service';

@Component({
  selector: 'app-contact',
  imports: [
    ReactiveFormsModule,
    MatError
  ],
  templateUrl: './contact.component.html',
  styleUrl: './contact.component.scss'
})

export class ContactComponent {
  private formBuilder = inject(FormBuilder);
  private snack = inject(SnackbarService);

  public contactForm = this.formBuilder.group({
    name: ['', Validators.required],
    email: ['', Validators.required, Validators.email],
    message: ['', Validators.required],
  })

  public onSubmit() {
    if (this.contactForm.invalid) {
      this.contactForm.markAllAsTouched();
      return;
    }
    
    this.snack.success('Message sent successfully!');
    
    this.contactForm.reset();
  }
}