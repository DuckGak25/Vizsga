import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, tap, throwError } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  loggedUser:any
  private apiUrl = 'http://127.0.0.1:8000/api';

  constructor(private http: HttpClient, private router: Router) {}

  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, userData);
  }

  login(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, userData);
  }
  
  isAdmin(): boolean {
    const user = localStorage.getItem('user');
    const headers = new HttpHeaders().set('Authorization', `Bearer ${user}`);

    if (user) {
      this.loggedUser = true
      try {
        const parsedUser = JSON.parse(user);
        return parsedUser.admin === 1 || parsedUser.admin === 2;
      } catch (e) {
        console.error('JSON Parse error:', e);
        return false;
      }
    }
    this.loggedUser = false
    return false;
  }

  isSuper(): boolean {
    const user = localStorage.getItem('user');
    const headers = new HttpHeaders().set('Authorization', `Bearer ${user}`);

    if (user) {
      this.loggedUser = true
      try {
        const parsedUser = JSON.parse(user);
        return parsedUser.admin === 2;
      } catch (e) {
        console.error('JSON Parse error:', e);
        return false;
      }
    }
    this.loggedUser = false
    return false;
  }

  getUsers(): Observable<any> {
    if (this.isSuper()) {
      return this.http.get(`${this.apiUrl}/getusers`, { headers: new HttpHeaders().set('Authorization', `Bearer ${localStorage.getItem('auth_token')}`) });
    }
    else {
      return this.http.get(`${this.apiUrl}/getusers`);
    }
  }

  setAdmin(user: any): Observable<any> {
    if (this.isSuper()) {
      return this.http.put(`${this.apiUrl}/setadmin`, { id: user.id }, { 
        headers: new HttpHeaders().set('Authorization', `Bearer ${localStorage.getItem('auth_token')}`)
      });
    } else {
      return throwError(() => new Error("Nincs jogosultságod!"));
    }
  }

  removeAdmin(user: any): Observable<any> {
    if (this.isSuper()) {
      return this.http.put(`${this.apiUrl}/removeadmin`, { id: user.id }, { 
        headers: new HttpHeaders().set('Authorization', `Bearer ${localStorage.getItem('auth_token')}`)
      });
    } else {
      return throwError(() => new Error("Nincs jogosultságod!"));
    }
  }



  getUser() {
    return this.loggedUser
  }
  
  
  
  logout() {
    const token = localStorage.getItem('auth_token');
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);
    this.http.post(`${this.apiUrl}/logout`, {}, { headers }).subscribe(
      () => {
        localStorage.removeItem('auth_token');
        localStorage.removeItem('user');
        // this.router.navigate(['/login']);
        window.location.href = '/login';
      },
      (error) => {
        console.error('Hiba a kijelentkezés során:', error);
      }
    );
  }
  
  
}
