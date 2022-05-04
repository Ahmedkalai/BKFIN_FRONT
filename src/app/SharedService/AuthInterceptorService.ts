import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { from, Observable } from 'rxjs';
import { TokenStorageService } from '../UserService/token-storage-service.service';
@Injectable({
  providedIn: 'root'
})
export class AuthInterceptorService implements HttpInterceptor {
  constructor(private tokenStorage: TokenStorageService) { }
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    if(req.url.includes("/login")){

    return next.handle(req);
  }
    else if(req.url.includes("api")){

      return next.handle(req);
    }
  else {
   // console.log(req.url)
    req = req.clone({
      setHeaders: {
        Authorization: `Bearer ${this.tokenStorage.getToken()}`,
        'Access-Control-Allow-Origin': '*'


  }
    });
    return next.handle(req);
  }
}
}
