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
            'name' => 'គ្រូ បន្ទុកថ្នាក់'
        ]);
        TeacherRole::create([
            'name' => 'បង្រៀន'
        ]);
    }
}
