<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\RecipeRequest;
use App\Http\Resources\Recipe as RecipeResource;
use App\Http\Requests\RecipeIngredientRequest;
use App\Http\Mail\RecipeApprovalRequest;
use App\Http\Controllers\ResponseController;
use Illuminate\Support\Facades\Gate;


class RecipeController extends ResponseController
{

    public function index()
    {
        $user = auth()->user();

        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipes = Recipe::with('ingredients', 'user')->get();
        return response()->json($recipes);
    }

    public function show($id)
    {
        $recipe = Recipe::with('ingredients')->find($id);
        if (!$recipe) {
            return $this->sendError("Adathiba", "Nem található recept", 404);
        }

        return response()->json($recipe);
    }

    
    public function showIngredients(RecipeRequest $request)
    {
        $user = auth()->user();

        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipe = Recipe::find($request->id);
        $ingredients = $recipe->ingredients;

        return response()->json($ingredients);
    }

    public function postRecipes(RecipeRequest $request)
    {
        $user = auth()->user();

        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipe = new Recipe();
        $recipe->title = $request[ "title" ];
        $recipe->description = $request[ "description" ];
        $recipe->categories = $request[ "categories" ];
        $recipe->imagelink = $request[ "imagelink" ];
        $recipe->user_id = $user->id;
        $recipe->language = $request[ "language" ];
        $recipe->save();
        return $this->sendResponse(new RecipeResource($recipe), "Sikeres recept hozzáadás");
    }

    public function deleteRecipe($id)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipe = Recipe::find($id);
    
        if (!$recipe) {
            return $this->sendError("Adathiba", "Nem található recept", 404);
        }
    
        $recipe->delete();
    
        return $this->sendResponse($recipe, "Sikeres recept törlés");
    }



    public function modifyRecipe(RecipeRequest $request) {

        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $validated = $request->validated();

        $recipe = Recipe::find($request->id);
        if (!$recipe) {
            return $this->sendError("Adathiba", "Nem található recept", 404);
        }
        $recipe->title = $validated['title'];
        $recipe->description = $validated['description'];
        $recipe->categories = $validated['categories'];
        $recipe->imagelink = $validated['imagelink'];
        $recipe->language = $validated['language'];
        $recipe->save();

        return $this->sendResponse(new RecipeResource($recipe), "Sikeres recept módosítás");
    }

    public function getFeaturedRecipes()
    {
        $featuredRecipes = Recipe::where('featured', true)->get();
        return response()->json($featuredRecipes);
    }

    public function toggleFeatured(RecipeRequest $request)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipe = Recipe::find($request->id);
        if (!$recipe) {
            return $this->sendError("Adathiba", "Nem található recept", 404);
        }
        $recipe->featured = !$recipe->featured;
        $recipe->save();

        return $this->sendResponse(new RecipeResource($recipe), "Sikeresen módosítottad a kiemelt állapotot!");
    }

    public function approveRecipe(RecipeRequest $request)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipe = Recipe::find($request->id);
        if (!$recipe) {
            return $this->sendError("Adathiba", "Nem található recept", 404);
        }
        $recipe->approved = !$recipe->approved;
        $recipe->save();

        return $this->sendResponse(new RecipeResource($recipe), "Elfogadtad a receptet!");
    }

    public function getApprovedRecipes()
    {
        $approvedRecipes = Recipe::where('approved', true)->with('ingredients', 'user')->get();
        return response()->json($approvedRecipes);
    }

    public function getNotApprovedRecipes() {

        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $notApprovedRecipes = Recipe::where('approved', false)->with('ingredients', 'user')->get();
        return response()->json($notApprovedRecipes);
    }

    public function getEnglishRecipes() {
        $englishRecipes = Recipe::where('language', 'en')->with('ingredients', 'user')->get();
        return response()->json($englishRecipes);
    }

    public function getHungarianRecipes() {
        $hungarianRecipes = Recipe::where('language', 'hu')->with('ingredients', 'user')->get();
        return response()->json($hungarianRecipes);
    }

}

