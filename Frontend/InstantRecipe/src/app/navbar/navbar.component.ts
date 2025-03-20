import { Component, ChangeDetectorRef } from '@angular/core';
import { Router } from '@angular/router';
import { ConfigService } from '../config.service';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})

export class NavbarComponent {
  isNavbarOpen = false;
  langSelectorCollapse = true;
  dropDownNavCollapse = true;
  navItems: any[] = [];
  langSelection: any[] = [];
  logout = "";
  isLoggedIn = false;
  addRecipe = "";
  search = "";
  flagLink = "";
  name = "";
  login = "";
  register = "";
  pantry = "";
  userRecipes = "";
  actLang = "Magyar";
  hamburgerActive = false;



  constructor(private config: ConfigService, private router: Router, private auth: AuthService) {
    config.getContent().subscribe((content) => {
      this.langSelection = content.langSelection || [];
      this.navItems = content.navItem || [];
      this.name = content.name || '';
      this.search = content.search || '';
      this.flagLink = content.flagLink || '';
      this.logout = content.logout || '';
      this.login = content.login || '';
      this.register = content.register || '';
      this.pantry = content.pantry || '';
      this.addRecipe = content.addRecipe || '';
      this.userRecipes = content.userRecipes || '';

    });
    
    
  }

  toggleNavbar() {
    this.isNavbarOpen = !this.isNavbarOpen;
    this.hamburgerActive = !this.hamburgerActive;
  }

  navigateTo(link: string) {
    window.location.href = link;
  }

  reloadPage() {
    window.location.reload();

  }

  ngOnInit() {
    const savedLanguage = localStorage.getItem('selectedLanguage');
    if (savedLanguage) {
      this.actLang = savedLanguage === 'en' ? 'English' : savedLanguage === 'de' ? 'Deutsch' : 'Magyar';
      this.config.changeLanguage(savedLanguage);
    }
      this.auth.getUser().subscribe((status) => {
        this.isLoggedIn = status;
      });
    

  }

  toggleLangSelector() {
    this.langSelectorCollapse = !this.langSelectorCollapse;
  }  
  
  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
    localStorage.setItem('selectedLanguage', lang.sign);
    this.langSelectorCollapse = true; 
  }

  logOut() {
    this.auth.logout();
  }

  getUser() {
    return this.auth.getUser();
  }

  isAdmin() {
    return this.auth.isAdmin();
  }
}
