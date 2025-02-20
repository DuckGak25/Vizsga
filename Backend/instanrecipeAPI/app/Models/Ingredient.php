<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Ingredient extends Model
{
    use HasFactory, Notifiable;

    public $timestamps = false;

    public function recipes()
    {
        return $this->belongsToMany(Recipe::class, 'recipe_ingredient')->withPivot('quantity');
    }
    
}
