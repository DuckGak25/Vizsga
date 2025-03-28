<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class Recipe extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'categories' => $this->categories,
            'imagelink' => $this->imagelink,
            'approved' => $this->approved,
            'language' => $this->language,
            'user_id' => $this->user_id
        ];
    }
}
