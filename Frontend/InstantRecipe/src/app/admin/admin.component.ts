import { Component } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router } from '@angular/router';
import { RecipeService } from '../recipe.service';

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
  pending = 0
  pendingText = ""

  constructor(private config: ConfigService, private router: Router, private recipeService: RecipeService) {

    this.getPendingRecipes();
  }

  ngOnInit() {
    this.loadContent();
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.adminPages = content.adminPages || [];
      this.adminWelcome = content.adminWelcome || '';
      this.pendingText = content.pending || '';
    });
  }

  navigateTo(link: string) {
    window.location.href = link;
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }

  getPendingRecipes() {
    this.recipeService.getPendingRecipes().subscribe(
      (recipes) => {
        for (let recipe of recipes) {
          this.pending++
        }
      },
      (error) => {
        console.error('Hiba a recept betöltésénél:', error);
      }
    );
  }






}
