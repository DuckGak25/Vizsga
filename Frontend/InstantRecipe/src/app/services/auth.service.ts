import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://127.0.0.1:8000/api';
  
  public loggedUser = new BehaviorSubject<boolean>(false);

  constructor(private http: HttpClient, private router: Router) {
    this.checkUserStatus();
  }

  private checkUserStatus() {
    const user = localStorage.getItem('user');
    this.loggedUser.next(!!user);
  }

  getUser(): Observable<boolean> {
    return this.loggedUser.asObservable();
  }

  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, userData);
  }

  login(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/login`, userData);
  }

  isAdmin(): boolean {
    const user = localStorage.getItem('user');
    if (user) {
      try {
        const parsedUser = JSON.parse(user);
        return parsedUser.admin === 1 || parsedUser.admin === 2;
      } catch (e) {
        console.error('JSON Parse error:', e);
        return false;
      }
    }
    return false;
  }

  isSuper(): boolean {
    const user = localStorage.getItem('user');
    if (user) {
      try {
        const parsedUser = JSON.parse(user);
        return parsedUser.admin === 2;
      } catch (e) {
        console.error('JSON Parse error:', e);
        return false;
      }
    }
    return false;
  }

  getUsers(): Observable<any> {
    if (this.isSuper()) {
      return this.http.get(`${this.apiUrl}/getusers`, { 
        headers: new HttpHeaders().set('Authorization', `Bearer ${localStorage.getItem('auth_token')}`) 
      });
    } else {
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

  logout() {
    const token = localStorage.getItem('auth_token');
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);

    this.http.post(`${this.apiUrl}/logout`, {}, { headers }).subscribe(
      () => {
        localStorage.removeItem('auth_token');
        localStorage.removeItem('user');
        this.loggedUser.next(false);
        window.location.href = '/login';
      },
      (error) => {
        console.error('Hiba a kijelentkezés során:', error);
      }
    );
  }
}