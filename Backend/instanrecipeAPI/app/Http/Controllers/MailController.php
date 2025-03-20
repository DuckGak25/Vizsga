<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Mail;
use App\Mail\RecipeAddMail;
use App\Mail\RecipeModifiedMail;
use App\Mail\RecipeWaitingForApproveMail;
use App\Models\Recipe;
use App\Models\User;
use Illuminate\Http\Request;

class MailController extends Controller
{
    public function sendRecipeAddMail($recipeId) {
        $recipe = Recipe::find($recipeId);
        $email = $recipe->user->email;
        $name = $recipe->user->name;
        $content = new RecipeAddMail($recipe);
        Mail::to($email, $name)->send($content);
    }
    public function sendRecipeModifiedMail($recipeId) {
        $recipe = Recipe::find($recipeId);
        $email = $recipe->user->email;
        $name = $recipe->user->name;
        $content = new RecipeModifiedMail($recipe);
        Mail::to($email, $name)->send($content);
    }

    public function sendRecipeWaitingForApproveMail($recipeId): void
    {
        $recipe = Recipe::findOrFail($recipeId);
        
        $admins = User::whereIn('admin', [1, 2])->get();
        
        foreach ($admins as $admin) {
            Mail::to($admin->email, $admin->name)->send(new RecipeWaitingForApproveMail($recipe));
        }
    }

    public function sendRecipeApprovedMail($recipeId): void {
        $recipe = Recipe::find($recipeId);
        $email = $recipe->user->email;
        $name = $recipe->user->name;
        $content = new RecipeApprovedMail($recipe);
        Mail::to($email, $name)->send($content);
    }
}
