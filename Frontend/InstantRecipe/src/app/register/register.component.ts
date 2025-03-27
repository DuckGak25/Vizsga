import { Component, ViewChild } from '@angular/core';
import { ConfigService } from '../services/config.service';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import { AuthService } from '../services/auth.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent {
  @ViewChild('content') content: any;
  registerCard: any[] = [];
  registerTitle = '';
  emailLabel = '';
  passwordText = '';
  confirmPasswordText = '';
  nameLabel = '';
  alreadyAccountLabel = '';
  signInGoogle = '';
  actLang = 'Magyar';
  langSign = "";
  loading: boolean = false;
  registerError: any = {
    show: false
  }
  inputClassName = 'form-control';
  inputClassEmail = 'form-control';
  inputClassPassword = 'form-control';
  showModal: boolean = false;
  modalTitle = '';
  modalContent = '';
  closeButton = '';

  name = '';
  email = '';
  password = '';
  confirm_password = '';
  error='';

  constructor(private config: ConfigService, private router: Router, private auth: AuthService, private modalService: NgbModal) {
    this.router.events
      .pipe(filter((event) => event instanceof NavigationEnd))
      .subscribe(() => {
        this.loadContent();
      });
      this.langSign = config.langSign
  }

  ngOnInit() {
    this.loadContent();
  }

  openModal() {
    this.modalService.open(this.content, { centered: true });
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.registerTitle = content.registerTitle || '';
      this.nameLabel = content.nameLabel || '';
      this.emailLabel = content.emailLabel || '';
      this.passwordText = content.passwordText || '';    
      this.confirmPasswordText = content.confirmPasswordText || '';
      this.alreadyAccountLabel = content.alreadyAccountLabel || '';
      this.closeButton = content.closeButton || '';
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
      if (this.langSign === 'hu') {
        this.registerError.message = 'Minden mezőt ki kell tölteni!';
      } else if (this.langSign === 'en') {
        this.registerError.message = 'Please fill all fields!';
      }
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
        if (this.langSign === 'hu') {
          this.modalContent = 'Sikeres regisztráció!';
        } else if (this.langSign === 'en') {
          this.modalContent = 'Successful registration!';
        }
        this.openModal();

        this.name = '';
        this.email = '';
        this.password = '';
        this.confirm_password = '';
        // this.navigateTo('/login');
      },
      (error) => {
        console.error('Hiba:', error);
        if (error.status === 422) {
          this.error = error.error.message;
          this.registerError.details = error.error.data || {};
          if (this.registerError.details.email) {
            if (Array.isArray(this.registerError.details.email)&& this.langSign=="en") {
              this.registerError.details.email = this.registerError.details.email.map((err: string) =>
                err === "Nem megfelelő email formátum" ? "Invalid email format" :
                err === "Email nem lehet üres" ? "Email can't be empty" :
                err === "Ez az email cím foglalt!" ? "This email is already in use!" :
                err
              );
            } else if (typeof this.registerError.details.email === "string") {
              this.registerError.details.email = this.registerError.details.email.replace(
                "Nem megfelelő email formátum",
                "Invalid email format"
              ).replace(
                "Email nem lehet üres",
                "Email can't be empty"
              ).replace(
                "Ez az email cím foglalt!",
                "This email is already in use!"
              );
            }
            this.inputClassEmail = "form-control is-invalid";
          }
          
          if (this.registerError.details.password) {
            if (
              this.registerError.details.password &&
              Array.isArray(this.registerError.details.password)&& this.langSign=="en"
            ) {
              this.registerError.details.password = this.registerError.details.password.map((err: string) =>
                err === "Jelszó nem lehet üres" ? "Password can't be empty" :
                err === "Túl rövid jelszó" ? "Too short password" :
                err === "A jelszónak tartalmazia kell kisbetűt, nagybetűt és számot"
                  ? "Password must contain at least one lowercase letter, one uppercase letter, and one number"
                  : err
              );
            } else if (typeof this.registerError.details.password === "string") {
              this.registerError.details.password = this.registerError.details.password.replace(
                "Jelszó nem lehet üres",
                "Password can't be empty"
              ).replace(
                "Túl rövid jelszó",
                "Too short password"
              ).replace(
                "A jelszónak tartalmazia kell kisbetűt, nagybetűt és számot",
                "Password must contain at least one lowercase letter, one uppercase letter, and one number"
              );
            }
            this.inputClassPassword = 'form-control is-invalid';
          }
          if (this.registerError.details.name) {
            this.inputClassName = 'form-control is-invalid';
          }
          if (this.registerError.details.confirm_password) {
            if (Array.isArray(this.registerError.details.confirm_password)&& this.langSign=="en") {
              this.registerError.details.confirm_password = this.registerError.details.confirm_password.map((err: string) =>
                err === "Nem egyező jelszó" ? "Passwords do not match" : err
              );
            } else if (typeof this.registerError.details.confirm_password === "string") {
              this.registerError.details.confirm_password = this.registerError.details.confirm_password.replace(
                "Nem egyező jelszó",
                "Passwords do not match"
              );
            }
            this.inputClassPassword = 'form-control is-invalid';
          }
        }
      }
    );
  }
}