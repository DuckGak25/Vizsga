<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;

Route::get('/recipes', [RecipeController::class, 'index']);
Route::get('/recipes/{id}', [RecipeController::class, 'show']);
Route::get('/recipes/{id}/ingredients', [RecipeController::class, 'showIngredients']);
Route::get('/ingredients', [RecipeController::class, 'showAllIngredients']);

Route::post('/postrecipe', [RecipeController::class, 'postRecipes']);
