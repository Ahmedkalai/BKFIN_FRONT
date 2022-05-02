import {Component, Input, NgZone, OnInit} from '@angular/core';
import {GuarantorService} from "../../../../Services/GuarantorService";
import {Router} from "@angular/router";
import {Guarantor} from "../../../../models/Guarantor";
import {Credit} from '../../../../models/Credit';
import {HttpClient} from '@angular/common/http';
import {Cloudinary} from '@cloudinary/angular-5.x';
import {FileUploader, FileUploaderOptions} from 'ng2-file-upload';

@Component({
  selector: 'app-form-guarantor',
  templateUrl: './form-guarantor.component.html',
  styleUrls: ['./form-guarantor.component.css']
})
export class FormGuarantorComponent implements OnInit {

  Guarant: Guarantor ;
  credit :Credit;


  @Input()
  responses: Array<any>;

  private hasBaseDropZoneOver: boolean = false;
  public uploader: FileUploader;
  private title: string;

  constructor(private guarantorService: GuarantorService , private router: Router ,private cloudinary: Cloudinary,
  private zone: NgZone,
  private http: HttpClient) {
  this.responses = [];
  this.title = '';

    // @ts-ignore
    // tslint:disable-next-line:only-arrow-functions
  this.cloudinary.config(['cloudinaryProvider', function (cloudinaryProvider) {
      cloudinaryProvider
        .set('cloud_name', 'dlw3w0bei')
        .set('secure', true)
        .set('upload_preset', 'msa732u9');
    }]);
  }





  ngOnInit(): void {
    this.Guarant={
      secondnameGarantor:null,
      nameGarantor:null,
      salaryGarantor:null,
      workGarantor:null,
      urlimage:null,
      idGarantor:null,
      credit:null
    };


  }





  // tslint:disable-next-line:typedef
  goToGuarantorList(){
    this.router.navigate(['listguarantor']);
  }

  urlll:any;
  filename:any;
  // tslint:disable-next-line:typedef
  onSubmit(){

    const uploadData = new FormData();
    uploadData.append('upload_preset', 'msa732u9');
    uploadData.append('file', this.selectedFile);
    uploadData.append('public_id', this.selectedFile.name );

    this.http.post('https://api.cloudinary.com/v1_1/dlw3w0bei/image/upload', uploadData).subscribe(
      data => {this.urlll=data;
        this.Guarant.urlimage=this.urlll.secure_url;

        this.guarantorService.createGuarantor(this.Guarant).subscribe( data1 => {
            console.log(data1);
            this.guarantorService.addfromfile(data1.idGarantor).subscribe(res => {
                console.log(res);
                if (res=="okkkkkkkkkkkkkkkkkk")
                {
                  this.router.navigateByUrl('/applycredit_2');
                }
                else { this.router.navigateByUrl('/error'); }
              }
            );
          },
          error => console.log(error));



      }



    );




    }

  selectedFile: File
  onFileChanged(event) {
    this.selectedFile = event.target.files[0]

  }



}


