<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'first_name_kh' => fake()->name(),
            'last_name_kh' => fake()->name(),
            'first_name_en' => fake()->name(),
            'last_name_en' => fake()->name(),
            'dob' =>  now(),
            'profile' => 'public/storage/uploads/1686829679_makara.jpg'
        ];
    }
}