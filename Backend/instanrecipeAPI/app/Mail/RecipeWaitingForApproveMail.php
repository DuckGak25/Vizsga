<?php
namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;
use App\Models\Recipe;

class RecipeWaitingForApproveMail extends Mailable
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
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Új receptet töltöttek fel!',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'recipe_waiting',
        );
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Új recept vár jóváhagyásra!')
                    ->view('recipe_waiting')
                    ->with([
                        'recipe' => $this->recipe,
                    ]);
    }
}
