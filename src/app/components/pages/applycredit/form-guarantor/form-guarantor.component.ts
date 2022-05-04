import {Component, Input, NgZone, OnInit} from '@angular/core';
import {GuarantorService} from "../../../../Services/GuarantorService";
import {ActivatedRoute, Router} from '@angular/router';
import {Guarantor} from "../../../../models/Guarantor";
import {Credit} from '../../../../models/Credit';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Cloudinary} from '@cloudinary/angular-5.x';
import {FileUploader, FileUploaderOptions} from 'ng2-file-upload';
import Swal from 'sweetalert2';
import {Client} from '../../../../models/Client';
@Component({
  selector: 'app-form-guarantor',
  templateUrl: './form-guarantor.component.html',
  styleUrls: ['./form-guarantor.component.css']
})
export class FormGuarantorComponent implements OnInit {

  Guarant: Guarantor ;
  credit :Credit;
  idpack:number=0;


  @Input()
  responses: Array<any>;
  constructor(private guarantorService: GuarantorService , private router: Router , private http: HttpClient,private route :ActivatedRoute) {
    this.idpack=this.route.snapshot.params['idpack'];
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


  urlll:any;
  filename:any;
  // tslint:disable-next-line:typedef
  onSubmit(){

    const uploadData = new FormData();
    uploadData.append('upload_preset', 'msa732u9');
    uploadData.append('file', this.selectedFile);
    let current = new Date();
    let timestamp = current.getTime();
    uploadData.append('public_id', this.selectedFile.name +timestamp );

    this.http.post('https://api.cloudinary.com/v1_1/dlw3w0bei/image/upload', uploadData).subscribe(
      data => {this.urlll=data;
        this.Guarant.urlimage=this.urlll.secure_url;

        this.guarantorService.createGuarantor(this.Guarant).subscribe( data1 => {
            console.log(data1);
            this.guarantorService.addfromfile(data1.idGarantor).subscribe(res => {
                console.log(res);
              // tslint:disable-next-line:triple-equals
                if (res=="okkkkkkkkkkkkkkkkkk")
                {
                  this.router.navigateByUrl('applycredit/form2/' + data1.idGarantor + '/' + this.idpack);
                }
                else if (res=="fail")
                { Swal.fire('Error', 'Error Invalid type of Pay Statement ', 'warning') ;
                  console.log(data1.idGarantor);
                  this.guarantorService.deleteGuarantor(data1.idGarantor).subscribe(res1 => console.log(res1));}
              }
            );
          },
          error => console.log(error));



      }



    );




    }

  selectedFile: File;
  onFileChanged(event) {
    this.selectedFile = event.target.files[0];

  }



}


