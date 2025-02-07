<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\RecipeRequest;
use App\Http\Resources\Recipe as RecipeResource;


class RecipeController extends Controller
{
    public function index()
    {
        $recipes = Recipe::with('ingredients')->get();
        return response()->json($recipes);
    }

    public function show($id)
    {
        $recipe = Recipe::with('ingredients')->find($id);
        
        if (!$recipe) {
            return response()->json(['message' => 'Nem található recept'], 404);
        }

        return response()->json($recipe);
    }

    
    public function showIngredients($id)
    {
        $recipe = Recipe::find($id);

        $ingredients = $recipe->ingredients;

        return response()->json($ingredients);
    }

    public function showAllIngredients()
    {
        $ingredients = DB::table('ingredients')->get();
        return response()->json($ingredients);
    }

    public function postRecipes(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string'
        ]);
    
        $recipe = Recipe::create($validatedData);
    
        return response()->json($recipe, 201);  
    }

    public function deleteRecipe($id)
    {
        $recipe = Recipe::find($id);
    
        if (!$recipe) {
            return response()->json(['message' => 'Nem található recept'], 404);
        }
    
        $recipe->delete();
    
        return response()->json(['message' => 'Recept sikeresen törölve'], 200);
    }

    public function destroy($id)
    {
        $recipe = Recipe::find($id);
    
        if ($recipe) {
            $recipe->delete();
            return response()->json(['message' => 'Recept törölve!'], 200);
        } else {
            return response()->json(['message' => 'Recept nem található!'], 404);
        }
    }
    
    
}

