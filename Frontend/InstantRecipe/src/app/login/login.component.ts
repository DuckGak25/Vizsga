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
  alreadyAccountLabel = '';
  signInGoogle = '';
  actLang = 'Magyar';
  loading: boolean = false;

  email = '';
  password = '';

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
      this.alreadyAccountLabel = content.alreadyAccountLabel || '';
      this.signInGoogle = content.signInGoogle || '';
    });
    
    
  }

  navigateTo(link: string) {
    this.router.navigate([link]).then(() => {
      window.scrollTo(0, 0);
    });
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
        alert('Sikeres bejelentkezés!');
        
        if (this.auth.isAdmin()) {
          // this.router.navigate(['/admin']);
          window.location.href = '/admin';
        } else {
          window.location.href = '/';
        }
      },
      (error) => {
        alert('Hibás email vagy jelszó!');
      }
    );
  }

  removeToken() {
    localStorage.removeItem('user');
    console.log('Token removed');
  }
  
  
  
}
