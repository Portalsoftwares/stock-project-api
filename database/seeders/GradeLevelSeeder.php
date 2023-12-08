<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\GradeLevel;

class GradeLevelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        GradeLevel::create([
            'grade_level_name' => '7'
        ]);
        GradeLevel::create([
            'grade_level_name' => '8'
        ]);
        GradeLevel::create([
            'grade_level_name' => '9'
        ]);
        GradeLevel::create([
            'grade_level_name' => '10'
        ]);
        GradeLevel::create([
            'grade_level_name' => '11'
        ]);
        GradeLevel::create([
            'grade_level_name' => '12'
        ]);
    }
}
