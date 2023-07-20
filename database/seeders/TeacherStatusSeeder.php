<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\TeacherStatus;


class TeacherStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        TeacherStatus::create([
            'status_kh' => 'កំពុងបង្រៀន',
            'status_en' => 'Teaching',
            'color' => '#84cc16'
        ]);
        TeacherStatus::create([
            'status_kh' => 'មិនបង្រៀន',
            'status_en' => 'Not Teaching',
            'color' => '#cbd5e1'
        ]);
        TeacherStatus::create([
            'status_kh' => 'បានឈប់',
            'status_en' => 'Stopped',
            'color' => '#ef4444'
        ]);
    }
}