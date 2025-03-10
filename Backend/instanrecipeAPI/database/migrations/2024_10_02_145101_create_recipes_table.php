<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('recipes', function (Blueprint $table) {
            $table->id();
            $table->string("title");
            $table->longText("description");
            $table->string("categories");
            $table->string("imagelink");
            $table->boolean('featured')->default(false);
<<<<<<< HEAD
            $table->string('status')->default('pending');
=======
            $table->foreignId('user_id');
            $table->boolean('approved')->default(false);
>>>>>>> 76070d28f4b97c1e48c86340aeae2709fb85bb84
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('recipes');
    }
};
