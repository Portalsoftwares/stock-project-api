<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Gender;

class GenderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Gender::create([
            'gender_name_kh' => 'ប្រុស',
            'gender_name_en' => 'Male',
            'gender_sort_name_kh' => 'ប',
            'gender_sort_name_en' => 'M'
        ]);
        Gender::create([
            'gender_name_kh' => 'ស្រី',
            'gender_name_en' => 'Female',
            'gender_sort_name_kh' => 'ស',
            'gender_sort_name_en' => 'F'
        ]);
    }
}
