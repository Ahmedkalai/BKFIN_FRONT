import { Component, OnInit } from '@angular/core';
import { NotificationService} from '../../../Services/notification.service';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import {Notification} from '../../../models/Notification';

@Component({
  selector: 'app-notificationback',
  templateUrl: './notificationback.component.html',
  styleUrls: ['./notificationback.component.css']
})
export class NotificationbackComponent implements OnInit {
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  filterTerm!: string;

  listNotifications: any;

  form = false;
  notification!: Notification;

  constructor(private notificationService: NotificationService, private modalService: NgbModal) { }

  ngOnInit(): void {
    this.getNotification();
    this.notification = {
      idNotification: null,
      dateNotif: null,
      object: null,
      credit: null
    };
  }
  getNotification(){
    this.notificationService.getAllNotifications().subscribe(res => this.listNotifications = res);
    }

    onTableDataChange(event: any) {
      this.page = event;
      this.getNotification();
    }
    onTableSizeChange(event: any): void {
      this.tableSize = event.target.value;
      this.page = 1;
      this.getNotification();
    }

    openVerticallyCentered(content) {
      this.modalService.open(content, { centered: true });
    }

    private getDismissReason(reason: any): string {
      if (reason === ModalDismissReasons.ESC) {
        return 'by pressing ESC';
      } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
        return 'by clicking on a backdrop';
      } else {
        return `with: ${reason}`;
      }
    }





}
