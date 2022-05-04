import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit } from '@angular/core';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import Swal from 'sweetalert2';
import {NotificationService} from '../../../Services/notification.service';
import {Notification} from '../../../models/Notification';
import {Client} from '../../../models/Client';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Component({
  selector: 'app-notificationbyclient',
  templateUrl: './notificationbyclient.component.html',
  styleUrls: ['./notificationbyclient.component.css'],
  changeDetection:ChangeDetectionStrategy.Default
})
export class NotificationbyclientComponent implements OnInit {
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  filterTerm!: string;

  listNotifications: any;
  listNotificationss: any;
  form = false;
  notification!: Notification;
  not:any;


  constructor(private notificationService: NotificationService, private modalService: NgbModal , private chRef : ChangeDetectorRef , private http: HttpClient) { }

  ngOnInit(): void {
    this.getNotificationByClient();
    this.addnotif()
    this.notification = {
      idNotification: null,
      dateNotif: null,
      object: null,
      credit: null
    };


  }


  private headers: HttpHeaders;
 getNotificationByClient(){
   this.http.get<Client>('http://localhost:8083/BKFIN/findClientByToken' , {
     headers: this.headers}).subscribe(res1 => {
       console.log(res1);
     this.notificationService.getNotificationByClient(res1.id).subscribe(res =>{this.listNotificationss = res;
       this.chRef.detectChanges();
       console.log(this.chRef)

     })
     }
   );


   }



   addnotif(){
     this.notificationService.addNotification().subscribe(res =>{this.not = res;
      console.log(res);
      if (res!==null)
{
  Swal.fire( 'you have received a payment note')
  res == null
}

      console.log("testangular");
   })
  }
   onTableDataChange(event: any) {
    this.page = event;
    this.getNotificationByClient();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getNotificationByClient();
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
