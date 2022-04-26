export class DuesHistoryService{
  import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';
import { DuesHistory } from './DuesHistory';

@Injectable({
  providedIn: 'root'
})
export class DuesHistoryService {

  private baseURL = "http://localhost:8083/BKFIN/DuesHistory";

  constructor(private httpClient: HttpClient) { }

  getDuesHistorysList(): Observable<DuesHistory[]>{
    return this.httpClient.get<DuesHistory[]>(`${this.baseURL}/retrieve-all-DuesHistory`);
  }

  createDuesHistory(DuesHistory: DuesHistory,idcredit:number): Observable<Object>{
    return this.httpClient.post(`${this.baseURL}/add-DuesHistory/${idcredit}`, DuesHistory);
  }

  getDuesHistoryById(id: number): Observable<DuesHistory>{
    return this.httpClient.get<DuesHistory>(`${this.baseURL}/retrieve-all-DuesHistory/${id}`);
  }

  updateDuesHistory(idcredit: number, DuesHistory: DuesHistory): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/modify-DuesHistory/${id}`, DuesHistory);
  }

  deleteDuesHistory(id: number): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/${id}`);
  }
}
}
