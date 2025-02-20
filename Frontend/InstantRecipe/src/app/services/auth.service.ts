import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://127.0.0.1:8000/api';

  constructor(private http: HttpClient) {}

  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, userData);
  }

  login(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, userData);
  }
  
  isAdmin(): boolean {
    const user = localStorage.getItem('user');
    console.log('User from localStorage:', user);
    if (user) {
      try {
        const parsedUser = JSON.parse(user);
        console.log('Parsed User:', parsedUser);
        return parsedUser.admin === 1 || parsedUser.admin === 2;
      } catch (e) {
        console.error('JSON Parse error:', e);
        return false;
      }
    }
    return false;
  }
  
  

  logout(): Observable<any> {
    return this.http.post(`${this.apiUrl}/logout`, {}, { withCredentials: true });
  }
}
