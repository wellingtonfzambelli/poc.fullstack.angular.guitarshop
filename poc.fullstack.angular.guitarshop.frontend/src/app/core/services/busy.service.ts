import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class BusyService {
  public loading = false;
  busyRequestCount = 0;

  constructor() { }

  busy() {
    this.busyRequestCount++;
    this.loading = true;
  }

  idel() {
    this.busyRequestCount--;

    if(this.busyRequestCount <= 0) {
      this.busyRequestCount = 0;
      this.loading = false;
    }
  }
}
