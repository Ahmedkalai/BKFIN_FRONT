import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoadupService {
  private API_URL = "http://localhost:8083/BKFIN/load";
  constructor(private httpClient: HttpClient) { }

  load(){
    return this.httpClient.get(`${this.API_URL}`)
  }
}
