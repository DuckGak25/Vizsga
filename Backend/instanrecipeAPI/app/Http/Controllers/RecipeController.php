<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


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
}

