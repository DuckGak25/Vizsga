<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\RecipeIngredientController;
use App\Http\Controllers\IngredientController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;

Route::get('/recipes/featured', [RecipeController::class, 'getFeaturedRecipes']);
Route::post( "/register", [ AuthController::class, "register" ]);
Route::post( "/login", [ AuthController::class, "login" ]);
Route::get('/recipes/{id}', [RecipeController::class, 'show']);

//Route::post('/postrecipe', [RecipeController::class, 'postRecipes']);
Route::middleware(['auth:sanctum'])->group( function () {
    Route::post( "/logout", [ AuthController::class, "logout" ]);
    
    Route::put("/setadmin", [ UserController::class, "setAdmin" ]);
    Route::put("/removeadmin", [ UserController::class, "removeAdmin" ]);
    Route::get("/getusers", [ UserController::class, "getUsers" ]);
    Route::get('/userrecipes', [RecipeController::class, 'getUserRecipes']);
    
    Route::get('/recipes', [RecipeController::class, 'getApprovedRecipes']);
    Route::get('/allrecipes', [RecipeController::class, 'index']);

    Route::get('/englishrecipes', [RecipeController::class, 'getEnglishRecipes']);
    Route::get('/hungarianrecipes', [RecipeController::class, 'getHungarianRecipes']);

    Route::get('/recipes/{id}/ingredients', [RecipeController::class, 'showIngredients']);

    
    Route::post('/postrecipe', [RecipeController::class, 'postRecipes']);
    Route::put('/modifyrecipe', [RecipeController::class, 'modifyRecipe']);
    Route::put('/modifyuserrecipe', [RecipeController::class, 'modifyUserRecipe']);
    Route::delete('/deleterecipe/{id}', [RecipeController::class, 'deleteRecipe']);
    Route::delete('/deleteuserrecipe/{id}', [RecipeController::class, 'deleteUserRecipe']);
    Route::post('/storerecipes', [RecipeController::class, 'store']);


    Route::post('/addingredient', [IngredientController::class, 'addIngredient']);
    Route::put('/modifyingredient', [IngredientController::class, 'modifyIngredient']);
    Route::delete('/destroyingredient/{id}', [IngredientController::class, 'destroyIngredient']);
    Route::get('/getingredients', [IngredientController::class, 'getIngredients']);
    Route::get('/getingredient/{id}', [IngredientController::class, 'getIngredient']);
    Route::get('/ingredients', [IngredientController::class, 'getIngredients']);

    Route::put('/editingredients', [RecipeIngredientController::class, 'editRecipeIngredient']);
    Route::delete('/deleteingredients', [RecipeIngredientController::class, 'deleteIngredient']);
    Route::post('/recipe-ingredients', [RecipeIngredientController::class, 'storeIngredients']);
    Route::delete('/delete-recipe-ingredient/{id}', [RecipeIngredientController::class, 'destroyRecipeIngredient']);

    Route::put("/toggle-featured", [ RecipeController::class, "toggleFeatured" ]);
    Route::put("/approve-recipe", [ RecipeController::class, "approveRecipe" ]);
    Route::get("/pendingrecipes", [ RecipeController::class, "getNotApprovedRecipes" ]);
});
