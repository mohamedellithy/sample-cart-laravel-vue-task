<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Product;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {
    return [
        //
        'name' => $faker->text($maxNbChars = 20),
        'description' => $faker->text($maxNbChars = 200),
        'price' => $faker->randomNumber(2),
        'quantity' => $faker->numberBetween($min = 1,$max=100),
    ];
});
