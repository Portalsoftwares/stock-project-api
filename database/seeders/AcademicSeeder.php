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
            'start_date' => '2022-01-01',
            'end_date' => '2023-01-01',
        ]);
        Academic::create([
            'academic_name' => 'ឆ្នាំសិក្សា​២០២៣​ - ២០២៤',
            'start_date' => '20223-01-01',
            'end_date' => '2024-01-01',
        ]);
    }
}
