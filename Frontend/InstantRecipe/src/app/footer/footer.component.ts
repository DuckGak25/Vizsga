import { Component } from '@angular/core';
import { ConfigService } from '../config.service';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrl: './footer.component.css'
})
export class FooterComponent {
  actLang = "Magyar";
  name = ""
  phone = ""
  addRecipe = "";
  search = "";
  login = "";
  register = "";
  pantry = "";
  userRecipes = "";
  home = ""
  copyright = ""
  links = ""
  isLoggedIn = false

  constructor(private config: ConfigService, private auth: AuthService) {
    this.actLang = config.langSign
    this.loadContent()
    this.auth.getUser().subscribe((status) => {
      this.isLoggedIn = status;
    });
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.home = content.home || '';
      this.name = content.name || '';
      this.phone = content.phone || '';
      this.addRecipe = content.addRecipe || '';
      this.search = content.search || '';
      this.login = content.login || '';
      this.register = content.register || '';
      this.pantry = content.pantry || '';
      this.userRecipes = content.userRecipes || '';
      this.copyright = content.copyright || '';
      this.links = content.links || '';
    });
  }

  navigateTo(link: string) {
    window.location.href = link;
    console.log(link);
  }
}
