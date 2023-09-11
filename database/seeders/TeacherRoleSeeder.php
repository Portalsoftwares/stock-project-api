<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\TeacherRole;

class TeacherRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        TeacherRole::create([
            'name' => 'គ្រូនាយក'
        ]);
        TeacherRole::create([
            'name' => 'នាយករង'
        ]);
        TeacherRole::create([
            'name' => 'ជំនួយការនាយក'
        ]);
        TeacherRole::create([
            'name' => 'លេខាធិការ'
        ]);
        TeacherRole::create([
            'name' => 'វិន័យ'
        ]);
        TeacherRole::create([
            'name' => 'បុ.ទីចាត់ការ'
        ]);
        TeacherRole::create([
            'name' => 'គ្រូបន្ទុក'
        ]);
        TeacherRole::create([
            'name' => 'សិក្ខាបនធារី'
        ]);
    }
}
