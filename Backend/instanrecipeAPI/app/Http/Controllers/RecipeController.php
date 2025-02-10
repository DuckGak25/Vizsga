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




public function store(Request $request)
{

    $validated = $request->validate([
        'title' => 'required|string|max:255',
        'description' => 'nullable|string',
        'categories' => 'nullable|string',
    ]);


    $recipe = Recipe::create([
        'title' => $validated['title'],
        'description' => $validated['description'],
        'categories' => $validated['categories'],
    ]);


    return response()->json($recipe, 201);
}


public function storeIngredients(Request $request)
{
    $validated = $request->validate([
        'recipe_id' => 'required|integer|exists:recipes,id',
        'ingredients' => 'required|array',
        'ingredients.*.ingredient_id' => 'required|integer|exists:ingredients,id',
        'ingredients.*.quantity' => 'nullable|string',
    ]);

    foreach ($validated['ingredients'] as $ingredient) {
        RecipeIngredient::create([
            'recipe_id' => $validated['recipe_id'],
            'ingredient_id' => $ingredient['ingredient_id'],
            'quantity' => $ingredient['quantity'],
        ]);
    }

    return response()->json(['message' => 'Ingredients added successfully'], 201);
}




    
    
    
}

