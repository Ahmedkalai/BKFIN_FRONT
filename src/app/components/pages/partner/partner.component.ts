import { HttpClient } from '@angular/common/http';
import { Component, Input, NgZone, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Cloudinary } from 'cloudinary-core';
import { FileUploader, FileUploaderOptions } from 'ng2-file-upload';
import { Partner } from 'src/app/models/Partner';
import { PartnerService } from 'src/app/Services/partner.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-partner',
  templateUrl: './partner.component.html',
  styleUrls: ['./partner.component.css']
})
export class PartnerComponent implements OnInit {
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  filterTerm!: string;
  partners:Partner[];
  partner:Partner=new Partner();


  constructor(private partnerservice: PartnerService, private router: Router, private modalService: NgbModal , private http: HttpClient) {



   }



  onTableDataChange(event: any) {
    this.page = event;
    this.getPartners();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getPartners();
  }
  open(content) {
    this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
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


  ngOnInit(): void {
    this.getPartners();


  }
  private getPartners(){
    this.partnerservice.getPartnersList().subscribe(data => {
      this.partners = data;
    });
  }
  editpartner(p:Partner){
    this.partnerservice.updatePartner(p).subscribe();
  }
  getPartner(id:Number){
    this.partnerservice.getPartnerById(id).subscribe(data => {
      this.partner = data;
    });
  }
  urlll:any;
  AddPartner(partner : Partner){
    const uploadData = new FormData();
    uploadData.append('upload_preset', 'msa732u9');
    uploadData.append('file', this.selectedFile);
    uploadData.append('public_id', this.selectedFile.name );
    uploadData.append('public_id', this.selectedFile.name );
    

    this.http.post('https://api.cloudinary.com/v1_1/dlw3w0bei/image/upload', uploadData).subscribe( url => {this.urlll=url;
      this.partner.logoPartner=this.urlll.secure_url;
      this.partnerservice.createPartner(partner).subscribe( data =>{
          console.log(data);
          this.getPartners();
        },
        error => console.log(error));}


    );


    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'The Partner is created successfully',
      showConfirmButton: false,
      timer: 1500
    })
  }

  deletePartner(id:Number){
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
    }).then((result) => {
      if (result.value) {
        this.partnerservice.deletePartner(id).subscribe(()=> this.getPartners());
        Swal.fire(
          'Deleted!',
          'The partner has been deleted.',
          'success'
        )
      } else if (
        result.dismiss === Swal.DismissReason.cancel)
      { Swal.fire(
        'Cancelled',
        'The partner is safe :)',
        'error')}})}

  selectedFile: File
  onFileChanged(event){
    this.selectedFile = event.target.files[0];

  }

}