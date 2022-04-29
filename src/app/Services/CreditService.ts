import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';
import {Credit} from "../models/Credit";

@Injectable({
  providedIn: 'root'
})
export class CreditService {

  private baseURL = "http://localhost:8083/BKFIN/Credit";

  constructor(private httpClient: HttpClient) { }

  getCreditsList(): Observable<Credit[]>{
    return this.httpClient.get<Credit[]>(`${this.baseURL}/retrieve-all-Credit`);
  }

  createCredit(Credit: Credit,idclient:number,idfund:number,idpack:number,idguarantor:number): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/add-Credit/${idclient}/${idfund}/${idpack}/${idguarantor}`, Credit);
  }

  getCreditById(id: number): Observable<Credit>{
    return this.httpClient.get<Credit>(`${this.baseURL}/retrieve-Credit/${id}`);
  }

  updateCredit( Credit: Credit,idclient:number,idfund:number,idpack:number,): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/${idclient}/${idfund}/${idpack}`, Credit);
  }

  deleteCredit(id: number): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/remove-credit/${id}`);
  }

}
