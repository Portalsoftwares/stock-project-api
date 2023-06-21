<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Subject;

class SubjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Subject::create([
            'name_kh' => 'ខ្មែរ',
            'name_en' => 'Khmer',
        ]);
        Subject::create([
            'name_kh' => 'គណិត',
            'name_en' => 'Math',
        ]);
        Subject::create([
            'name_kh' => 'រូប',
            'name_en' => 'Physic',
        ]);
        Subject::create([
            'name_kh' => 'គីមី',
            'name_en' => 'Chimistery',
        ]);
        Subject::create([
            'name_kh' => 'ជីវះ',
            'name_en' => 'Biology'
        ]);
        Subject::create([
            'name_kh' => 'ភូមិ',
            'name_en' => 'Phylosophy'
        ]);
        Subject::create([
            'name_kh' => 'ប្រវត្តិ',
            'name_en' => 'History'
        ]);
    }
}
