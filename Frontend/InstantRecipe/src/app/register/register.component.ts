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
  registerError: any = {
    show: false
  }
  inputClassName = 'form-control';
  inputClassEmail = 'form-control';
  inputClassPassword = 'form-control';



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
    window.location.href = link;
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }

  register() {
    this.registerError = { show: false, message: '', details: {} };
    this.inputClassEmail = 'form-control';
    this.inputClassPassword = 'form-control';
    this.inputClassName = 'form-control';
  
    if (!this.name || !this.email || !this.password || !this.confirm_password) {
      this.registerError.show = true;
      this.registerError.message = 'Minden mezőt ki kell tötlteni!';
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
          this.registerError.message = error.error.message || 'Hibás adatok!';
          this.registerError.details = error.error.data || {};
          if (this.registerError.details.email) {
            this.inputClassEmail = 'form-control is-invalid';
          }
          if (this.registerError.details.password) {
            this.inputClassPassword = 'form-control is-invalid';
          }
          if (this.registerError.details.name) {
            this.inputClassName = 'form-control is-invalid';
          }
          if (this.registerError.details.confirm_password) {
            this.inputClassPassword = 'form-control is-invalid';
          }
        }
      }
    );
  }

}
