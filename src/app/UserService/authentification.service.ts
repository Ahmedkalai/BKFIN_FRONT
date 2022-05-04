import { HttpHeaders,HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { Client } from '../Models/client';
import { Observable, throwError } from 'rxjs';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json'})
};
@Injectable({
  providedIn: 'root'
})
export class AuthentificationService {
  ClientUrl="http://localhost:8083/BKFIN"
  currentUser:Observable<any>
  constructor(public http:HttpClient) { }

  logn(data): Observable<any> {
 
    return this.http.post("http://localhost:8083/BKFIN/login",{
      username: data.email,
      password: data.password
    ,observe: "response", responseType: 'text' as 'json',httpOptions});
    
  }
  

 
  logOut() {
    // remove user from local storage to log user out
    return this.http.post(`${this.ClientUrl}/logout`, {})
   
 
  }
  AddClient(id:number,c:Client){
    return this.http.post(`${this.ClientUrl}/insertClient/${id}`,c)
  }

  public getCurrentUser(): Observable<any> {
    return this.currentUser;
  }

}
/*.subscribe((res:any) => {
    // login successful if there's a jwt token in the response
  //  console.log(this.client)
    console.log(resp.headers.get('token'));
    this.client=resp
     // the returned user object is a principal object
    console.log(this.client)
    if (this.client!=undefined) {
      // store user details  in local storage to keep user logged in between page refreshes
      //SessionStorage.setItem('username', this.client.email);
      localStorage.setItem( 'user',JSON.stringify(this.client))
      console.log(sessionStorage)
   }
    else {
      alert("Authentication failed.");
  } 
  });
   public logIn(user): Observable<any>{
    
   // const base64Credential: string = btoa( user.email + ':' + user.password);
  // let body = `username=${user.email}&password=${user.password}`
 
   const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': 'http://localhost:8083/**',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'POST,GET, POST, OPTIONS, PUT,DELETE'
      
    });
    headers.append( 'No-Auth', 'True');
    
    //console.log(this.http.post(`${this.ClientUrl}/login`, body,{observe: "response", responseType: 'text' as 'json',headers: headers}))
   return this.http.post(`${this.ClientUrl}/login`, user,{observe: "response", responseType: 'text' as 'json',headers: headers})
  }
  login(user: Client): Observable<any> {
    const base64Credential: string = btoa( user.email + ':' + user.password);
    let body = `username=${user.email}&password=${user.password}`
    const headers = new HttpHeaders({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'POST',
      'Authorization': 'basic'+base64Credential
    });
    
    
    return this.http.post(`${this.ClientUrl}/login`,body,{observe: "response", responseType: 'text' as 'json',headers: headers})
  }

*/