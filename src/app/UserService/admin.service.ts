import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Admin } from '../Models/admin';
import { TokenStorageService } from './token-storage-service.service';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  _activeUser: Admin = <Admin>{};
  private headers: HttpHeaders;
 AdminUrl="http://localhost:8083/BKFIN/Admin"
 constructor(private httpClient:HttpClient,private tokenStorage: TokenStorageService){ }
 get activeUser(): Admin {
  return this._activeUser;
}

set activeUser(user: Admin) {
  this._activeUser = user;
}


 

  getAllAdmin(){
    return this.httpClient.get(`${this.AdminUrl}/Admins`)
  }
  AddAdmin(ad:Admin){
    return this.httpClient.post(`${this.AdminUrl}/AjoutAdmin`,ad)
  }
  DeleteAdmin(id:number){
    return this.httpClient.delete(`${this.AdminUrl}/DeleteAdmin/${id}`)
  }
  public findUserWithToken() {
    this.headers = new HttpHeaders({
      Authorization: 'Bearer ' + this.tokenStorage.getToken(),
      'Access-Control-Allow-Origin': '*'
    });
    return this.httpClient.get<Admin>("http://localhost:8083/BKFIN/findAdminByToken", {
      headers: this.headers,
    }).subscribe((user:Admin) => {
      this._activeUser = user
      console.log(this._activeUser.idAdmin);
    });
  }

}
