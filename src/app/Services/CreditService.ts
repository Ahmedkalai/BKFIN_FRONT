import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';
import {Credit} from '../models/Credit';
import {Amorrtissement} from '../models/Amorrtissement';

@Injectable({
  providedIn: 'root'
})
export class CreditService {

  private baseURL = "http://localhost:8083/BKFIN/Credit";

  constructor(private httpClient: HttpClient) { }

  getCreditsList(): Observable<Credit[]>{
    return this.httpClient.get<Credit[]>(`${this.baseURL}/retrieve-all-Credit`);
  }

  // tslint:disable-next-line:no-shadowed-variable
  Simulate(mnttotl:number,period:number,interst:number): Observable<Amorrtissement>{
    return this.httpClient.get<Amorrtissement>(`${this.baseURL}/simulate/${mnttotl}/${period}/${interst}`);
  }
  tab(mnttotl:number,period:number,interst:number): Observable<Amorrtissement>{
    return this.httpClient.get<Amorrtissement>(`${this.baseURL}/tab/${mnttotl}/${period}/${interst}`);
  }
  createCredit(Credit: Credit,idclient:number,idfund:number,idpack:number,idguarantor:number): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/add-Credit/${idclient}/${idfund}/${idpack}/${idguarantor}`, Credit);
  }

  getCreditById(id: number): Observable<Credit>{
    return this.httpClient.get<Credit>(`${this.baseURL}/retrieve-Credit/${id}`);
  }

  updateCredit( Credit: Credit,idclient:number,idfund:number,idpack:number): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/${idclient}/${idfund}/${idpack}`, Credit);
  }

  deleteCredit(id: number): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/remove-credit/${id}`);
  }

  downloadFile(mnttotl:number,period:number,interst:number) {
    return this.httpClient.get<any>(`${this.baseURL}/export/excel/${mnttotl}/${period}/${interst}`, {responseType: 'arraybuffer' as'json'});
  }

  getActiveCredit(idclient: number): Observable<Credit>{
    return this.httpClient.get<Credit>(`${this.baseURL}/activeCredit/${idclient}`);
  }

  getLastCredit(idclient: number): Observable<Credit>{
    return this.httpClient.get<Credit>(`${this.baseURL}/lastcredit/${idclient}`);
  }
}
