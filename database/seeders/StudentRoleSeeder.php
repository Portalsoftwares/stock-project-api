<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\StudentRole;

class StudentRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        StudentRole::create([
            'name' => 'ប្រធាន'
        ]);
        StudentRole::create([
            'name' => 'អនុប្រធាន'
        ]);
        StudentRole::create([
            'name' => 'សមាជិក'
        ]);
    }
}
