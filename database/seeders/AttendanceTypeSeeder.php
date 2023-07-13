<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\AttendanceType;

class AttendanceTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        AttendanceType::create([
            'attendance_name' => 'វត្តមាន',
            'attendance_sort_name' => 'PS',
        ]);
        AttendanceType::create([
            'attendance_name' => 'ច្បាប់',
            'attendance_sort_name' => 'PM',
        ]);
        AttendanceType::create([
            'attendance_name' => 'យឺត',
            'attendance_sort_name' => 'AL',
        ]);
        AttendanceType::create([
            'attendance_name' => 'អវត្តមាន',
            'attendance_sort_name' => 'A',
        ]);
    }
}
