<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Day;

class DaySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Day::create([
            'name' => 'ច័ន្ទ',
        ]);
        Day::create([
            'name' => 'អង្គារ៍',
        ]);
        Day::create([
            'name' => 'ពុធ',
        ]);
        Day::create([
            'name' => 'ព្រហស្បតិ៍',
        ]);
        Day::create([
            'name' => 'សុក្រ',
        ]);
        Day::create([
            'name' => 'សៅរ៍',

        ]);
        Day::create([
            'name' => 'អាទិត្យ',
        ]);
    }
}
