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

    
    public function showIngredients(RecipeRequest $request)
    {
        $recipe = Recipe::find($request->id);

        $ingredients = $recipe->ingredients;

        return response()->json($ingredients);
    }

    public function postRecipes(RecipeRequest $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'categories' => 'string',
            'imagelink' => 'string' 
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

public function store(RecipeRequest $request)
{
    $validated = $request->validated();
    $recipe = Recipe::create([
        'title' => $validated['title'],
        'description' => $validated['description'],
        'categories' => $validated['categories'],
        'imagelink' => $validated['imagelink']
    ]);


    return response()->json($recipe, 201);
}

public function modifyRecipe(RecipeRequest $request) {
    $validated = $request->validated();

    $recipe = Recipe::find($request->id);
    $recipe->title = $validated['title'];
    $recipe->description = $validated['description'];
    $recipe->categories = $validated['categories'];
    $recipe->imagelink = $validated['imagelink'];
    $recipe->save();

    return response()->json($recipe);
}

public function getFeaturedRecipes()
{
    $featuredRecipes = Recipe::where('featured', true)->get();
    return response()->json($featuredRecipes);
}

public function toggleFeatured(RecipeRequest $request)
{
    $recipe = Recipe::find($request->id);

    $recipe->featured = !$recipe->featured;
    $recipe->save();

    return response()->json($recipe);
}

    
    
    
}

