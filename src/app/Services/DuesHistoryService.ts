import {HttpClient} from '@angular/common/http';
import {DuesHistory} from '../models/DuesHistory';
import {Observable} from 'rxjs';
import {Injectable} from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DuesHistoryService {

  private baseURL = "http://localhost:8083/BKFIN/DuesHistory";

  constructor(private httpClient: HttpClient) { }

  getDuesHistorysList(): Observable<DuesHistory[]>{
    return this.httpClient.get<DuesHistory[]>(`${this.baseURL}/retrieve-all-DuesHistory`);
  }

  getDuesHistorysList_bycredit(idcredit :number ): Observable<DuesHistory[]>{
    return this.httpClient.get<DuesHistory[]>(`${this.baseURL}/retrieve-all-DuesHistory-Credit/${idcredit}`);
  }

  createDuesHistory(DuesHistory: DuesHistory,idcredit:number): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/add-DuesHistory/${idcredit}`, DuesHistory);
  }

  getDuesHistoryById(id: number): Observable<DuesHistory>{
    return this.httpClient.get<DuesHistory>(`${this.baseURL}/retrieve-all-DuesHistory/${id}`);
  }

  updateDuesHistory(idcredit: number, DuesHistory: DuesHistory): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/modify-DuesHistory/${idcredit}`, DuesHistory);
  }

  deleteDuesHistory(id: number): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/${id}`);
  }
}

