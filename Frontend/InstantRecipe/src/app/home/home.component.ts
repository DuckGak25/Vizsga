import { Component, OnInit } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';
import AOS from 'aos';
import { RecipeService } from '../recipe.service';
import { Recipe } from '../models/recipe.model';
import { AuthService } from '../services/auth.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  homecontent1cards: any[] = [];
  homecontent2cards: any[] = [];
  homeText1 = "";
  homeText2 = "";
  text = "";
  link = "";
  pic = "";
  homecontent1title = "";
  homecontent2title = "";
  isLoggedIn = false;
  actLang = "Magyar";
  loading= false;
  recipes: Recipe[] = [];

  constructor(private config: ConfigService, private router: Router, private recipeService: RecipeService, private auth: AuthService) {
    this.auth.getUser().subscribe((status) => {
      this.isLoggedIn = status;
    });

    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe(() => {
        this.loadContent();
      });
  }

  ngOnInit() {
    this.loadContent();
    AOS.init({
      once: true
    });
    this.recipeService.getFeaturedRecipes().subscribe((data: Recipe[]) => {
      this.recipes = data.filter(recipe => recipe.language === this.config.langSign);
      console.log(this.recipes);
    });
  }

 
  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.homecontent1cards = content.homecontent1card || [];
      this.homecontent2cards = content.homecontent2card || [];
      this.homecontent1title = content.homecontent1title || '';
      this.homecontent2title = content.homecontent2title || '';
      this.text = content.text || '';
      this.pic = content.pic || '';
      this.link = content.link || '';
      this.homeText1 = content.homeText1 || '';
      this.homeText2 = content.homeText2 || '';
    });
  }

  navigateTo(link: string) {
    window.location.href = link;
    console.log(link);
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }
}