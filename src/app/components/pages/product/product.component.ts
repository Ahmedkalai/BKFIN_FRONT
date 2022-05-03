import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Pack } from 'src/app/models/Pack';
import { Partner } from 'src/app/models/Partner';
import { Product } from 'src/app/models/product';
import { PackService } from 'src/app/Services/pack.service';
import { PartnerService } from 'src/app/Services/partner.service';
import { ProductService } from 'src/app/Services/product.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {
  closeResult = '';
  page: number = 1;
  count: number = 0;
  tableSize: number = 6;
  tableSizes: any = [3, 6, 9, 12];

  filterTerm!: string;
  products:Product[];

  Product:Product=new Product();


  packs:Pack[];
  public idProduct:Number;
  public idPack:Number;
  
  idPartner:Number;
  partners: Partner[];
  constructor(private productservice: ProductService,
    private router: Router, private modalService: NgbModal,private PartnerService: PartnerService,private Packservice: PackService) { }
    onTableDataChange(event: any) {
      this.page = event;
      this.getProducts();
    }
    onTableSizeChange(event: any): void {
      this.tableSize = event.target.value;
      this.page = 1;
      this.getProducts();
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
    this.getProducts();
    this.PartnerService.getPartnersList().subscribe(data => {
      this.partners = data;
    });
    this.Packservice.getPacksList().subscribe(data => {
      this.packs = data;
    });
  }
private getProducts(){
  this.productservice.getProductsList().subscribe(data => {
    this.products = data;
  });
}
deleteproduct(id: Number){
  this.productservice.deleteProduct(id).subscribe( data => {
    console.log(data);
    this.getProducts();
  })
}
scrap(){
  this.productservice.scrapProduct().subscribe({
    next:()  =>console.log("added") ,
    error: err => {this.getProducts(),console.log(err)},
    complete: () => this.getProducts()
});
}
addProduct(Product:Product){
  this.productservice.createProduct(Product,this.idPartner).subscribe( data =>{
    console.log(data);
    this.getProducts();
  },
  error => console.log(error));
}
deleteProduct(id:Number){
  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes, delete it!',
    cancelButtonText: 'No, cancel!',
  }).then((result) => {
    if (result.value) {
    this.productservice.deleteProduct(id).subscribe(()=> this.getProducts());
    Swal.fire(
      'Deleted!',
      'The product has been deleted.',
      'success'
    )
} else if (
   result.dismiss === Swal.DismissReason.cancel)
   { Swal.fire(
      'Cancelled',
      'The product is safe :)',
      'error')}})
    }

    getProduct(id:Number){
      this.productservice.getProductById(id).subscribe(data => {
        this.Product = data;
      });
    }
    editproduct(Product:Product){
      this.productservice.updateProduct(Product,this.idPartner).subscribe(()=> this.getProducts());
    }
    download(){
      this.productservice.downloadFile().subscribe( (res =>
        {
          let file= new Blob([res], { type: 'application/pdf'});
          var fileUrl =URL.createObjectURL(file);
          window.open(fileUrl);
        }));}
    public affecter(idProduct:Number,idPack:Number){
      this.productservice.affecterproductpack(idProduct,idPack).subscribe( data => {
          console.log(data);
            
          })
        }
}



