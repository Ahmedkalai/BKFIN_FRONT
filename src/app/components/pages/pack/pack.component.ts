import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';

import { Pack } from 'src/app/models/Pack';
import { Product } from 'src/app/models/product';
import { PackService } from 'src/app/Services/pack.service';
import { ProductService } from 'src/app/Services/product.service';
import Swal from 'sweetalert2';
import {HttpClient} from '@angular/common/http';


@Component({
  selector: 'app-pack',
  templateUrl: './pack.component.html',
  styleUrls: ['./pack.component.css']
})
export class PackComponent implements OnInit {
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];
  idpack:Number[];
  filterTerm!: string;
  packs:Pack[];
  pack:Pack=new Pack();
  products:Product[];
  idProduct:Number;
  selected = [];
  constructor(private packservice: PackService,
              private router: Router, private modalService: NgbModal,private productservice :ProductService , private http: HttpClient) { }
  onTableDataChange(event: any) {
    this.page = event;
    this.getPacks();
  }
  onTableSizeChange(event: any): void {
    this.tableSize = event.target.value;
    this.page = 1;
    this.getPacks();
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
    this.getPacks();
    this.productservice.getProductsList().subscribe(data => {
      this.products = data;
    });
  }
  private getPacks(){
    this.packservice.getPacksList().subscribe(data => {
      this.packs = data;
    });
  }
  editpack(p:Pack){
    this.packservice.modifPack(p,this.idProduct).subscribe();
  }
  getPack(id:Number){
    this.packservice.getPackById(id).subscribe(data => {
      this.pack = data;
    });
  }
  urlll:any;
  addpack(pack : Pack){
    const uploadData = new FormData();
    let current = new Date();
    let timestamp = current.getTime();
    uploadData.append('public_id', this.selectedFile.name +timestamp );
    uploadData.append('upload_preset', 'msa732u9');
    uploadData.append('file', this.selectedFile);
    uploadData.append('public_id', this.selectedFile.name+ timestamp);

    this.http.post('https://api.cloudinary.com/v1_1/dlw3w0bei/image/upload', uploadData).subscribe(res=> {this.urlll=res;
      this.pack.imagePack=this.urlll.secure_url;
      this.packservice.addPack(pack,this.idProduct).subscribe( data =>{
          console.log(data);
          this.getPacks();
        },
        error => console.log(error));
    });

    Swal.fire({
      position: 'top-end',
      icon: 'success',
      title: 'The Pack is created successfully',
      showConfirmButton: false,
      timer: 1500
    })
  }

  deletePack(id:Number){
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
    }).then((result) => {
      if (result.value) {
        this.packservice.deletePack(id).subscribe(()=> this.getPacks());
        Swal.fire(
          'Deleted!',
          'The pack has been deleted.',
          'success'
        )
      } else if (
        result.dismiss === Swal.DismissReason.cancel)
      { Swal.fire(
        'Cancelled',
        'The pack is safe :)',
        'error')}})}
  statePack(id:Number){
    this.packservice.updateStatePack(id).subscribe(()=> this.getPacks())
  }

  selectedFile: File
  onFileChanged(event) {
    this.selectedFile = event.target.files[0];

  }
}