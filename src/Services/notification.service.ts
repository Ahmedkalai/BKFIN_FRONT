import { Injectable } from '@angular/core';
import {HttpClient, HttpClientModule} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  readonly API_URL = '/api/BKFIN';


  constructor(private httpClient: HttpClient) {
  }

  getAllNotifications() {
    return this.httpClient.get(`${this.API_URL}/Notification/retrieve-all-notification`);
  }

  getNotificationByClient(clientid: number) {
    return this.httpClient.get(`${this.API_URL}/Notification/retrieve-notificationByClient/${clientid}`);
  }
   addNotification(){
     return this.httpClient.post(`${this.API_URL}/Notification/add-notification`,Notification);
   }
}
