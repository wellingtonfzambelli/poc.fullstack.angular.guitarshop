import { HttpClient } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { MatButton } from '@angular/material/button';

@Component({
  selector: 'app-test-error',
  imports: [
    MatButton
  ],
  templateUrl: './test-error.component.html',
  styleUrl: './test-error.component.scss'
})

export class TestErrorComponent {
  public baseUrl = 'https://localhost:6001/api/v1/'
  public validationErrors?: string[];

  constructor(private http: HttpClient) {

  }

  get400ValidationError() {
    this.http.post(this.baseUrl + 'mock-error/validation-error', {}).subscribe({
      next: response => console.log(response),
      error: error => this.validationErrors = error
    })
  }

  get400Error() {
    this.http.get(this.baseUrl + 'mock-error/bad-request').subscribe({
      next: response => console.log(response),
      error: error => console.log(error)
    })
  }

  get404Error() {
    this.http.get(this.baseUrl + 'mock-error/not-found').subscribe({
      next: response => console.log(response),
      error: error => console.log(error)
    })
  }

  get401Error() {
    this.http.get(this.baseUrl + 'mock-error/unauthorized').subscribe({
      next: response => console.log(response),
      error: error => console.log(error)
    })
  }

  get500Error() {
    this.http.get(this.baseUrl + 'mock-error/server-error').subscribe({
      next: response => console.log(response),
      error: error => console.log(error)
    })
  }
}