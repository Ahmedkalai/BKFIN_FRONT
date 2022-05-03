import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {Guarantor} from '../models/Guarantor';


export class GuarantorService{
  private baseURL = "http://localhost:8083/BKFIN/Garantor";
  readonly PythonURL='/python';

  constructor(private httpClient: HttpClient) { }

  getGuarantorsList(): Observable<Guarantor[]>{
    return this.httpClient.get<Guarantor[]>(`${this.baseURL}/retrieve-all-Garantor`);
  }

  createGuarantor(Guarantor: Guarantor): Observable<any>{
    return this.httpClient.post(`${this.baseURL}/add-Garantor/3`, Guarantor);
  }

  getGuarantorById(id: number): Observable<Guarantor>{
    return this.httpClient.get<Guarantor>(`${this.baseURL}/retrieve-Garantor/${id}`);
  }

  updateGuarantor( Guarantor: Guarantor): Observable<Object>{
    return this.httpClient.put(`${this.baseURL}/modify-Garantor`, Guarantor);
  }

  deleteGuarantor(id: number): Observable<Object>{
    return this.httpClient.delete(`${this.baseURL}/remove-Garantor/${id}`);
  }

  addfromfile(idgr) {
    return this.httpClient.post(`${this.PythonURL}/ocr/${idgr}`,null);

  }
}
