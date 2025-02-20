import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class SuperGuard implements CanActivate {
  constructor(private router: Router) {}

  canActivate(): boolean {
    const user = JSON.parse(localStorage.getItem('user') || '{}');

    if (user && user.admin === 2) {
      return true;
    } else {
      this.router.navigate(['/']);
      return false;
    }
  }
}

