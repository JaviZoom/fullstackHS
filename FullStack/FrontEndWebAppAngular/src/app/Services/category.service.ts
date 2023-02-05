import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import { ResponseApi } from '../Interfaces/response-api';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  private apiUrl:string="http://localhost:8080/api/Category/"; 

  constructor(private http:HttpClient) { }

  getList():Observable<ResponseApi>{
    return this.http.get<ResponseApi>(`${this.apiUrl}List`);
  }
}
