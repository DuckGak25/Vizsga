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
            $table->foreignId('ingredient_id');
            $table->foreignId('recipe_id');
            $table->string("quantity");
            
        });
    }

    public function down()
    {
        Schema::dropIfExists('recipe_ingredient');
    }
}
