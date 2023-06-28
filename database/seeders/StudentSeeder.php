<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Student;


class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Student::create(
            [
                'first_name_kh' => 'សិន​',
                'last_name_kh' => 'មាលា',
                'first_name_en' => 'sin',
                'last_name_en' => 'Melea',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student1.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'ភីម',
                'last_name_kh' => 'សាមី',
                'first_name_en' => 'Phim',
                'last_name_en' => 'Samiii',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student2.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'ផន',
                'last_name_kh' => 'វិ ហាប់​',
                'first_name_en' => 'Porn',
                'last_name_en' => 'Vi hab',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student3.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'វីរះ',
                'last_name_kh' => 'ច័ន្ទណាវី',
                'first_name_en' => 'Vireak',
                'last_name_en' => 'Chann navy',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student4.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'ភូមិ',
                'last_name_kh' => 'ខ​ មាស',
                'first_name_en' => 'Phom',
                'last_name_en' => ' K Meas',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student5.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'សៀវ ',
                'last_name_kh' => 'ស្រីណែត',
                'first_name_en' => 'Siev',
                'last_name_en' => 'Srey neath',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student6.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'ម៉ាប់ ',
                'last_name_kh' => 'ពិរុណ',
                'first_name_en' => 'Mab',
                'last_name_en' => 'Piron',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student7.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'ឡាយ ',
                'last_name_kh' => 'សារឿន',
                'first_name_en' => 'Lay',
                'last_name_en' => 'Sa roeun',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student8.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => ' លំអង ',
                'last_name_kh' => 'ឡុង',
                'first_name_en' => 'Lomong',
                'last_name_en' => 'Long',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student9.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'ឯក',
                'last_name_kh' => 'សារិទ្ធ',
                'first_name_en' => 'Ek',
                'last_name_en' => 'Sarith',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/student10.jpg'
            ]
        );
        Student::create(
            [
                'first_name_kh' => 'សន',
                'last_name_kh' => 'ដាវ់ាន់',
                'first_name_en' => 'Sorn',
                'last_name_en' => 'Davann',
                'dob' =>  now(),
                'profile' => 'public/storage/uploads/1686830640_R.jpg'
            ]
        );
    }
}
