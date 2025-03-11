import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PantryComponent } from './pantry/pantry.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { RecipesComponent } from './recipes/recipes.component';
import { AppLoadingComponent } from './app-loading/app-loading.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { AdminComponent } from './admin/admin.component';
import { RecipeDetailComponent } from './recipe-detail/recipe-detail.component';
import { AddRecipeComponent } from './add-recipe/add-recipe.component';
import { RecipesListComponent } from './components/recipes-list/recipes-list.component';
import { UsersComponent } from './components/users/users.component';
import { IngredientsListComponent } from './components/ingredients-list/ingredients-list.component';
import { AdminGuard } from './guards/admin.guard';
import { SuperGuard } from './guards/super.guard';
import { UserGuard } from './guards/user.guard';


const routes: Routes = [
  {path:"home", component: HomeComponent},
  {path: "pantry", component: PantryComponent, canActivate: [UserGuard] },
  {path: "recipes", component: RecipesComponent},
  {path: "app-loading", component: AppLoadingComponent},
  {path: "register", component: RegisterComponent},
  {path: "login", component: LoginComponent},
  {path: "admin", component: AdminComponent, canActivate: [AdminGuard] },
  { path: 'recipes/:id', component: RecipeDetailComponent },
  { path: 'admin/recipes-list', component: RecipesListComponent, canActivate: [AdminGuard] },
  { path: 'admin/ingredients-list', component: IngredientsListComponent, canActivate: [AdminGuard] },
  {path: 'admin/users', component: UsersComponent, canActivate: [SuperGuard] },

  {path: "addrecipe", component: AddRecipeComponent},
  {path:"", redirectTo:'/home', pathMatch:'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
