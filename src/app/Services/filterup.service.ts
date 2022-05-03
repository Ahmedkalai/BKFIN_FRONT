import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class FilterupService {
  private API_URL = "http://localhost:8083/BKFIN/UPopulation";
  constructor(private httpClient: HttpClient) { }

  filter(){
    return this.httpClient.get(`${this.API_URL}/getRegionByEnvironment`)
  }
}
