<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Academic;

class AcademicSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Academic::create([
            'academic_name' => 'ឆ្នាំសិក្សា​២០២២​ - ២០២៣',
            'start_date' => '01-01-2022',
            'end_date' => '01-01-2023',
        ]);
        Academic::create([
            'academic_name' => 'ឆ្នាំសិក្សា​២០២៣​ - ២០២៤',
            'start_date' => '01-01-20223',
            'end_date' => '01-01-2024',
        ]);
    }
}
