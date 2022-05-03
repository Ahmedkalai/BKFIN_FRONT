import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';
import {Reclamation} from '../models/Reclamation';

//@Injectable({
  //providedIn: 'root'
//})
export class ReclamationService {
  readonly API_URL = '/api/BKFIN';
  readonly API_URL2='/python/rec'


  constructor(private httpClient: HttpClient) { }

  getAllReclamation() {
    return this.httpClient.get(`${this.API_URL}/Complaint/retrieve-all-complaint`);
  }

  addReclamation(reclamation:Reclamation,clientid:number){
     return this.httpClient.post(`${this.API_URL}/Complaint/add-complaint/${clientid}`,reclamation);
   }
   verifier(id:number,information:string){
     return this.httpClient.get(`${this.API_URL2}/${information}/${id}`)

   }


   ModifReclamation(reclamation:Reclamation,clientid:number) :  Observable<Object>{
    return this.httpClient.put(`${this.API_URL}/Complaint/modify-complaint/${clientid}`,reclamation);


  }

  ModifReclamationState(complaintId:number){
    return this.httpClient.put(`${this.API_URL}/Complaint/modify-complaintState/${complaintId}`,Reclamation);
  }

  getReclamationByClient(clientid:number) {
    return this.httpClient.get(`${this.API_URL}/Complaint/retrieve-complaintByClient/${clientid}`);
  }

  getReclamationById(complaintid:number): Observable<Reclamation>{
    return this.httpClient.get<Reclamation>(`${this.API_URL}/Complaint/retrieve-complaint/${complaintid}`);
  }





}
