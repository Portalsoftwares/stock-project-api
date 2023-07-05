<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Subject;

class SubjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Subject::create([
            'subject_name_kh' => 'ភាសាខ្មែរ',
            'subject_name_en' => 'Khmer',
            'subject_sort_name_en' => 'K',
        ]);
        Subject::create([
            'subject_name_kh' => 'គណិតវិទ្យា',
            'subject_name_en' => 'Math',
            'subject_sort_name_en' => 'M',
        ]);
        Subject::create([
            'subject_name_kh' => 'រូបវិទ្យា',
            'subject_name_en' => 'Physic',
            'subject_sort_name_en' => 'P',
        ]);
        Subject::create([
            'subject_name_kh' => 'គីមីវិទ្យា',
            'subject_name_en' => 'Chimistery',
            'subject_sort_name_en' => 'C',
        ]);
        Subject::create([
            'subject_name_kh' => 'ជីវះវិទ្យា',
            'subject_name_en' => 'Biology',
            'subject_sort_name_en' => 'B',
        ]);
        Subject::create([
            'subject_name_kh' => 'ភូមិវិទ្យា',
            'subject_name_en' => 'Giography',
            'subject_sort_name_en' => 'G',
        ]);
        Subject::create([
            'subject_name_kh' => 'ប្រវត្តិវិទ្យា',
            'subject_name_en' => 'History',
            'subject_sort_name_en' => 'H',
        ]);
    }
}
