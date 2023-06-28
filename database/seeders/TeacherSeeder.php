<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Teacher;


class TeacherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Teacher::create(
            [
                'first_name_kh' => 'សោភា',
                'last_name_kh' => 'ស៊ីវម៉ី',
                'first_name_en' => 'Sopea',
                'last_name_en' => 'Sivmey',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher10.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'សុខ សាន្ត',
                'last_name_kh' => 'វណ្ណា',
                'first_name_en' => 'sok san',
                'last_name_en' => 'vana',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher9.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'កែវ',
                'last_name_kh' => 'ចន្ទវត្តី',
                'first_name_en' => 'keo',
                'last_name_en' => 'chanvettey',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher8.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'គីម',
                'last_name_kh' => 'សុភារី',
                'first_name_en' => 'kim',
                'last_name_en' => 'sopheary',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher7.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'ទេព',
                'last_name_kh' => 'ទេវី',
                'first_name_en' => 'teb',
                'last_name_en' => 'tevy',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher6.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'ម្លិះរួត',
                'last_name_kh' => 'មល្លិកា',
                'first_name_en' => 'mlekrout',
                'last_name_en' => 'milekka',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher5.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'សាល',
                'last_name_kh' => 'តារារស្មី',
                'first_name_en' => 'sal',
                'last_name_en' => 'darareaksmey',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher4.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'នាង',
                'last_name_kh' => 'សុជាតា',
                'first_name_en' => 'neng',
                'last_name_en' => 'socheata',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher3.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'រិន',
                'last_name_kh' => 'បុរី',
                'first_name_en' => 'rin',
                'last_name_en' => 'borey',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher2.jpg'
            ]
        );
        Teacher::create(
            [
                'first_name_kh' => 'មាលី',
                'last_name_kh' => 'មាលា',
                'first_name_en' => 'Maly',
                'last_name_en' => 'Melea',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/teacher1.jpg'
            ]
        );
    }
}
