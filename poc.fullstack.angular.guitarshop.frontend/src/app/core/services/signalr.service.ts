import { Injectable, signal } from '@angular/core';
import { HubConnection, HubConnectionBuilder, HubConnectionState } from '@microsoft/signalr';
import { environment } from '../../../environments/environment';
import { Order } from '../../shared/models/Order';

@Injectable({
  providedIn: 'root'
})

export class SignalrService {
  public hubUrl = environment.hubUrl;
  public hubConnection?: HubConnection;
  public orderSignal = signal<Order | null>(null);

  public createHubConnection() {
    
    this.hubConnection = new HubConnectionBuilder()
      .withUrl(this.hubUrl, {
        withCredentials: true
      })
      .withAutomaticReconnect()
      .build();

      this.hubConnection.start()
        .catch(error => console.log(error));

      this.hubConnection.on("OrderCompleteNotification", (order: Order) => {
        this.orderSignal.set(order);
      })
  }

  public stopHubConnection() {
    if (this.hubConnection?.state === HubConnectionState.Connected) {
      this.hubConnection.stop().catch(error => console.log(error))
    }
  }
}