import { Component } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  registerCard: any[] = [];
  loginTitle = '';
  emailLabel = '';
  passwordText = '';
  confirmPasswordText = '';
  nameLabel = '';
  notRegistered = '';
  signInGoogle = '';
  actLang = 'Magyar';
  loading: boolean = false;

  email = '';
  password = '';
  error = "";

  inputClassEmail = 'email-input form-control';
  inputClassPassword = 'password-input form-control';

  constructor(private config: ConfigService, private router: Router, private auth: AuthService) {
    this.router.events
      .pipe(filter((event) => event instanceof NavigationEnd))
      .subscribe(() => {
        this.loadContent();
      });
  }

  ngOnInit() {
    this.loadContent();
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.loginTitle = content.loginTitle || '';
      this.nameLabel = content.nameLabel || '';
      this.emailLabel = content.emailLabel || '';
      this.passwordText = content.passwordText || '';
      
      this.confirmPasswordText = content.confirmPasswordText || '';
      this.notRegistered = content.notRegistered || '';
      this.signInGoogle = content.signInGoogle || '';
    });
    
    
  }

  navigateTo(url: string) {
    window.location.href = url;
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }
  
  login() {
      this.auth.login({ email: this.email, password: this.password }).subscribe(
      (response) => {
        localStorage.setItem('auth_token', response.token);
        localStorage.setItem('user', JSON.stringify(response.user));

        
        if (this.auth.isAdmin()) {
          window.location.href = '/admin';
        } else {
          window.location.href = '/';
        }
      },
      (error) => {
        console.error('Hiba:', error);
        if (error.status === 401) {
          this.error = error.error.message;
          this.inputClassEmail = 'form-control email-input  is-invalid';
          this.inputClassPassword = 'form-control password-input  is-invalid';
        }
      }
    );
  }
  

  removeToken() {
    localStorage.removeItem('user');
    console.log('Token removed');
  }

  
  
  
  
}
