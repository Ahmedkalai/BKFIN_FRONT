import { Component, OnInit } from '@angular/core';
import { NotificationService } from 'src/Services/notification.service';
import { Notification } from 'src/Model/Notification';

@Component({
  selector: 'app-notificationbyclient',
  templateUrl: './notificationbyclient.component.html',
  styleUrls: ['./notificationbyclient.component.css']
})
export class NotificationbyclientComponent implements OnInit {
  listNotifications: any;
  listNotificationss: any;
  form = false;
  notification!: Notification;


  constructor(private notificationService: NotificationService) { }

  ngOnInit(): void {
    this.getNotificationByClient();
    this.notification = {
      idNotification: null,
      dateNotif: null,
      object: null,
      credit: null
    };
  }
  

  
 getNotificationByClient(){
   this.notificationService.getNotificationByClient(1).subscribe(res => this.listNotificationss = res);
   }
}
