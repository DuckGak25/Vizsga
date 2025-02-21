import { Component } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent {
  registerCard: any[] = [];
  registerTitle = '';
  emailLabel = '';
  passwordText = '';
  confirmPasswordText = '';
  nameLabel = '';
  alreadyAccountLabel = '';
  signInGoogle = '';
  actLang = 'Magyar';
  loading: boolean = false;

  name = '';
  email = '';
  password = '';
  confirm_password = '';

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
      this.registerTitle = content.registerTitle || '';
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

  register() {
    if (this.password !== this.confirm_password) {
      alert('A jelszavak nem egyeznek!');
      return;
    }
  
    this.auth.register({
      name: this.name,
      email: this.email,
      password: this.password,
      confirm_password: this.confirm_password
    }).subscribe(
      (response) => {
        console.log('Sikeres regisztráció:', response);
        alert('Sikeres regisztráció!');
      },
      (error) => {
        console.error('Hiba:', error);
        if (error.status === 422) {
          const errors = error.error.errors;
          if (errors.email) {
            alert(errors.email[0]);
          } else if (errors.password) {
            alert(errors.password[0]);
          } else {
            alert('Hibás adatok!');
          }
        } else {
          alert(error.error.message || 'Szerverhiba történt.');
        }
      }
    );
  }
  
  
  
}
