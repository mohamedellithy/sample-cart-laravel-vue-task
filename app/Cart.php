<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    //
   protected $fillable = ['token_cart' , 'content'];

    protected $casts = [
        'content' => 'array'
    ];
}
