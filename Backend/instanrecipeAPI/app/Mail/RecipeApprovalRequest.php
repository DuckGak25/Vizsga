<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class RecipeApprovalRequest extends Mailable
{
    use Queueable, SerializesModels;

    public $recipe;

    public function __construct(Recipe $recipe)
    {
        $this->recipe = $recipe;
    }

    public function build()
    {
        return $this->subject('Új recept jóváhagyásra vár')
                    ->view('emails.recipe_approval')
                    ->with(['recipe' => $this->recipe]);
    }
}
