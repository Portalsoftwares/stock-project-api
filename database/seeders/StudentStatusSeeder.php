<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\StudentStatus;

class StudentStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        StudentStatus::create([
            'status_kh' => 'កំពុងសិក្សា',
            'status_en' => 'Studying',
            'color' => '#84cc16'
        ]);
        StudentStatus::create([
            'status_kh' => 'បានឈប់',
            'status_en' => 'Stopped',
            'color' => '#ef4444'
        ]);
    }
}
