<?php

namespace Database\Seeders;

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
            'day_name_kh' => 'ថ្ងៃ ច័ន្ទ',
            'day_name_en' => 'Monday',
        ]);
        Day::create([
            'day_name_kh' => 'ថ្ងៃ អង្គារ៍',
            'day_name_en' => 'Tuesday',
        ]);
        Day::create([
            'day_name_kh' => 'ថ្ងៃ ពុធ',
            'day_name_en' => 'Wenesday',
        ]);
        Day::create([
            'day_name_kh' => 'ថ្ងៃ ព្រហស្បតិ៍',
            'day_name_en' => 'Thursday',
        ]);
        Day::create([
            'day_name_kh' => 'ថ្ងៃ សុក្រ',
            'day_name_en' => 'Friday',
        ]);
        Day::create([
            'day_name_kh' => 'ថ្ងៃ សៅរ៍',
            'day_name_en' => 'saturday',
        ]);
    }
}
