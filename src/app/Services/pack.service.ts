import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Pack } from '../models/Pack';

@Injectable({
  providedIn: 'root'
})
export class PackService {
  readonly API_URL =  'http://localhost:8083/BKFIN';;
  constructor(private httpClient: HttpClient) { };

  getPacksList(): Observable<Pack[]>{
    return this.httpClient.get<Pack[]>(`${this.API_URL}/Pack/viewPacks`);
  }
  getPacksListActif(): Observable<Pack[]>{
    return this.httpClient.get<Pack[]>(`${this.API_URL}/Pack/viewPacksActif`);
  }

  createPack(Pack: Pack): Observable<Object>{
    return this.httpClient.post(`${this.API_URL}/Pack/ajouterPack`, Pack);
  }

  getPackById(idPack: Number): Observable<Pack>{
    return this.httpClient.get<Pack>(`${this.API_URL}/Pack/viewPack/${idPack}`);
  }

  updatePack(Pack: Pack):Observable<Object>{
    return this.httpClient.put(`${this.API_URL}/Pack/updatePack`, Pack);
  }
  updateStatePack(idPack:Number): Observable<Object>{
    return this.httpClient.put(`${this.API_URL}/Pack/statepack/${idPack}`, Pack);
  }
  affectPrice():Observable<Object>{
    return this.httpClient.put(`${this.API_URL}/Pack/priceP`, Pack);
  }
  deletePack(idPack: Number): Observable<Object>{
    return this.httpClient.delete(`${this.API_URL}/Pack/deleteP/${idPack}`);
  }
  addPack(Pack: Pack,idPack:any): Observable<Object>{
    return this.httpClient.post(`${this.API_URL}/Pack/addPack/${idPack}`, Pack);
  }
  modifPack(Pack:Pack,idPack:any): Observable<Object>{
    return this.httpClient.post(`${this.API_URL}/Pack/modifPack/${idPack}`, Pack);
}
}
