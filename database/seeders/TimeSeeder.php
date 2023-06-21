<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Time;

class TimeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Time::create([
            'name' => 'ម៉ោងទី១',
            'start_date' => '07:00:00',
            'end_date' => '08:00:00',
        ]);
        Time::create([
            'name' => 'ម៉ោងទី២',
            'start_date' => '08:00:00',
            'end_date' => '09:00:00',
        ]);
        Time::create([
            'name' => 'ម៉ោងទី៣',
            'start_date' => '09:00:00',
            'end_date' => '10:00:00',
        ]);
        Time::create([
            'name' => 'ម៉ោងទី៤',
            'start_date' => '10:00:00',
            'end_date' => '11:00:00',
        ]);
    }
}
