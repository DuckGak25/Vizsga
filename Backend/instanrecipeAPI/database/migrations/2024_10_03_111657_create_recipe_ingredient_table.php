<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecipeIngredientTable extends Migration
{
    public function up()
    {
        Schema::create('recipe_ingredient', function (Blueprint $table) {
            $table->id();
            $table->foreignId('recipe_id')->constrained()->onDelete('cascade'); // Kapcsolat a receptekkel
            $table->foreignId('ingredient_id')->constrained()->onDelete('cascade'); // Kapcsolat a hozzávalókkal
            $table->integer('quantity'); // Mennyiség mező
        });
    }

    public function down()
    {
        Schema::dropIfExists('recipe_ingredient');
    }
}
