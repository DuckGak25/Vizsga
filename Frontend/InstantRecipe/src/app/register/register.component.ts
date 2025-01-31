import { Component } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';

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

  constructor(private config: ConfigService, private router: Router) {
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
}
