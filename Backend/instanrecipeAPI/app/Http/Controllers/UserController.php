<?php

namespace App\Http\Controllers;



use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Controllers\ResponseController;
use Illuminate\Support\Facades\Gate;

class UserController extends ResponseController {

    
    public function setAdmin(Request $request) {

        if ( !Gate::allows("super") ) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }

        $user = User::find($request["id"]);

        $user->admin = 1;

        $user->update();

        return $this->sendResponse($user->name, "Admin jog megadva");
    }

}
