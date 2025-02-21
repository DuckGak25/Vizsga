import { Component } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrl: './admin.component.css'
})
export class AdminComponent {

  actLang = "Magyar"

  adminWelcome = '';
  adminPages: any[] = [];
  user: any = JSON.parse(localStorage.getItem('user') || '{}');


  constructor(private config: ConfigService, private router: Router) {}

  ngOnInit() {
    this.loadContent();
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.adminPages = content.adminPages || [];
      this.adminWelcome = content.adminWelcome || '';
    });
  }

  navigateTo(link: string) {
    window.location.href = link;
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }




}
