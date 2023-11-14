<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Subject;
use App\Models\SubjectGradeLevel;

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

          //Subject Level  10
          SubjectGradeLevel::create([
            'subject_id'=>1,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>150,
            'divide'=>3,
            'average'=>75,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>2,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>150,
            'divide'=>3,
            'average'=>75,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>3,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>50,
            'divide'=>1,
            'average'=>25,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>4,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>37,
            'divide'=>0.75,
            'average'=>17,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>5,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>38,
            'divide'=>0.75,
            'average'=>17,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>6,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>38,
            'divide'=>0.75,
            'average'=>17,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>7,
            'grade_level_id'=>1,
            'class_type_id'=>1,
            'full_score'=>38,
            'divide'=>0.75,
            'average'=>17,
         ]);
         //11 វីទ្យាសាស្រ្ត
         SubjectGradeLevel::create([
            'subject_id'=>1,
            'grade_level_id'=>2,
            'class_type_id'=>2,
            'full_score'=>75,
            'divide'=>1.5,
            'average'=>37,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>2,
            'grade_level_id'=>2,
            'class_type_id'=>2,
            'full_score'=>125,
            'divide'=>2.5,
            'average'=>62,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>3,
            'grade_level_id'=>2,
            'class_type_id'=>2,
            'full_score'=>75,
            'divide'=>1.5,
            'average'=>37,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>4,
            'grade_level_id'=>2,
            'class_type_id'=>2,
            'full_score'=>75,
            'divide'=>1.5,
            'average'=>37,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>5,
            'grade_level_id'=>2,
            'class_type_id'=>2,
            'full_score'=>75,
            'divide'=>1.5,
            'average'=>37,
         ]);
         SubjectGradeLevel::create([
            'subject_id'=>6,
            'grade_level_id'=>2,
            'class_type_id'=>2,
            'full_score'=>50,
            'divide'=>1,
            'average'=>25,
         ]);
         SubjectGradeLevel::create([
             'subject_id'=>7,
             'grade_level_id'=>2,
             'class_type_id'=>2,
             'full_score'=>50,
             'divide'=>1,
             'average'=>25,
         ]);
         //11 សង្គម
         SubjectGradeLevel::create([
         'subject_id'=>1,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>125,
         'divide'=>2.5,
         'average'=>62,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>2,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>3,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>50,
         'divide'=>1,
         'average'=>25,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>4,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>50,
         'divide'=>1,
         'average'=>25,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>5,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>50,
         'divide'=>1,
         'average'=>25,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>6,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>7,
         'grade_level_id'=>2,
         'class_type_id'=>3,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         //12 វីទ្យាសាស្រ្ត
         SubjectGradeLevel::create([
         'subject_id'=>1,
         'grade_level_id'=>3,
         'class_type_id'=>2,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>2,
         'grade_level_id'=>3,
         'class_type_id'=>2,
         'full_score'=>125,
         'divide'=>2.5,
         'average'=>62,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>3,
         'grade_level_id'=>3,
         'class_type_id'=>2,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>4,
         'grade_level_id'=>3,
         'class_type_id'=>2,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>5,
         'grade_level_id'=>3,
         'class_type_id'=>2,
         'full_score'=>75,
         'divide'=>1.5,
         'average'=>37,
         ]);
         SubjectGradeLevel::create([
         'subject_id'=>6,
         'grade_level_id'=>3,
         'class_type_id'=>2,
         'full_score'=>50,
         'divide'=>1,
         'average'=>25,
         ]);
         SubjectGradeLevel::create([
             'subject_id'=>7,
             'grade_level_id'=>3,
             'class_type_id'=>2,
             'full_score'=>50,
             'divide'=>1,
             'average'=>25,
         ]);
 
         //12 សង្គម
         SubjectGradeLevel::create([
             'subject_id'=>1,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>125,
             'divide'=>2.5,
             'average'=>62,
             ]);
             SubjectGradeLevel::create([
             'subject_id'=>2,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>75,
             'divide'=>1.5,
             'average'=>37,
             ]);
             SubjectGradeLevel::create([
             'subject_id'=>3,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>50,
             'divide'=>1,
             'average'=>25,
             ]);
             SubjectGradeLevel::create([
             'subject_id'=>4,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>50,
             'divide'=>1,
             'average'=>25,
             ]);
             SubjectGradeLevel::create([
             'subject_id'=>5,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>50,
             'divide'=>1,
             'average'=>25,
             ]);
             SubjectGradeLevel::create([
             'subject_id'=>6,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>75,
             'divide'=>1.5,
             'average'=>37,
             ]);
             SubjectGradeLevel::create([
             'subject_id'=>7,
             'grade_level_id'=>3,
             'class_type_id'=>3,
             'full_score'=>75,
             'divide'=>1.5,
             'average'=>37,
             ]);
 
    }
}
