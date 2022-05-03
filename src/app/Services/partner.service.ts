import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Partner } from "../models/partner";

@Injectable({
  providedIn: 'root'
})
export class PartnerService {
  readonly API_URL = "http://localhost:8083/BKFIN";
  constructor(private httpClient: HttpClient) { }
  
  getPartnersList(): Observable<Partner[]>{
    return this.httpClient.get<Partner[]>(`${this.API_URL}/Partner/viewPartners`);
  }

  createPartner(Partner: Partner): Observable<Object>{
    return this.httpClient.post(`${this.API_URL}/Partner/ajouterPartner`, Partner);
  }

  getPartnerById(idPartner: Number): Observable<Partner>{
    return this.httpClient.get<Partner>(`${this.API_URL}/Partner/viewPartner/${idPartner}`);
  }

  updatePartner(Partner: Partner): Observable<Object>{
    return this.httpClient.put(`${this.API_URL}/Partner/updatePartner`, Partner);
  }

  deletePartner(idPartner: Number): Observable<Object>{
    return this.httpClient.delete(`${this.API_URL}/Partner/deleteP/${idPartner}`);
  }
}
