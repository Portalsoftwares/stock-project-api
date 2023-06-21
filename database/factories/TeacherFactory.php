<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Teacher>
 */
class TeacherFactory extends Factory
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
            'profile' =>  fake()->image('public/storage/images', 400, 300)
            
         ];
    }
}