import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import { Item } from '../Interfaces/item';
import { ResponseApi } from '../Interfaces/response-api';

@Injectable({
  providedIn: 'root'
})
export class ItemService {
  private apiUrl:string="http://localhost:8080/api/Item/";  

  constructor(private http:HttpClient) { }

  getList():Observable<ResponseApi>{
    return this.http.get<ResponseApi>(`${this.apiUrl}List`);
  }

  add(request:Item):Observable<ResponseApi>{
    return this.http.post<ResponseApi>(`${this.apiUrl}Create`,request);
  }

  update(request:Item):Observable<ResponseApi>{
    return this.http.put<ResponseApi>(`${this.apiUrl}Edit`,request);
  }

  delete(IdItem:number):Observable<ResponseApi>{
    return this.http.delete<ResponseApi>(`${this.apiUrl}Delete/${IdItem}`);
  }

}
