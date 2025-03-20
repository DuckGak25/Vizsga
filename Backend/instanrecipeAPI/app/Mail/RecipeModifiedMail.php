<?php
namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Recipe;

class RecipeModifiedMail extends Mailable
{
    use Queueable, SerializesModels;

    public Recipe $recipe;

    /**
     * Create a new message instance.
     *
     * @param Recipe $recipe
     */
    public function __construct(Recipe $recipe)
    {
        $this->recipe = $recipe;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Recept módosítva')
                    ->view('recipemodified')
                    ->with([
                        'recipe' => $this->recipe,
                    ]);
    }
}
