<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ClassType;

class ClassTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ClassType::create([
            'name' => 'ថ្នាក់ ធម្មតា',
            'note' => 'សម្រាប់ថ្នាក់ទី​៧​,៨,​៩,១០'
        ]);
        ClassType::create([
            'name' => 'ថ្នាក់ វិទ្យាសាស្រ្តពិត',
            'note' => 'សម្រាប់ថ្នាក់ទី​១១,១២'
        ]);
        ClassType::create([
            'name' => 'ថ្នាក់ វិទ្យាសាស្រ្តសង្គម',
            'note' => 'សម្រាប់ថ្នាក់ទី​១១,១២'
        ]);
    }
}
