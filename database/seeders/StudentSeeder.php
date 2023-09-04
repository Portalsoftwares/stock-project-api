<?php

namespace Database\Seeders;

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
                'sid' => 'PK-S0001',
                'full_name_kh' => 'សិន​ មាលា',
                'full_name_en' => 'sin Melea',
                'first_name_kh' => 'សិន​',
                'last_name_kh' => 'មាលា',
                'first_name_en' => 'sin',
                'last_name_en' => 'Melea',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "11",
                'phone' => "08765432345",
                'email' => "melea@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0002',
                'full_name_kh' => 'ភីម សាមី',
                'full_name_en' => 'Phim Samiii',
                'first_name_kh' => 'ភីម',
                'last_name_kh' => 'សាមី',
                'first_name_en' => 'Phim',
                'last_name_en' => 'Samiii',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "12",
                'phone' => "08765432345",
                'email' => "Samiii@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0002',
                'full_name_kh' => 'ផន វិហាប់​',
                'full_name_en' => 'Porn Vihab',
                'first_name_kh' => 'ផន',
                'last_name_kh' => 'វិហាប់​',
                'first_name_en' => 'Porn',
                'last_name_en' => 'Vihab',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "13",
                'phone' => "08765432345",
                'email' => "hab@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0003',
                'full_name_kh' => 'វីរះ ច័ន្ទណាវី',
                'full_name_en' => 'Vireak Chann navy',
                'first_name_kh' => 'វីរះ',
                'last_name_kh' => 'ច័ន្ទណាវី',
                'first_name_en' => 'Vireak',
                'last_name_en' => 'Chann navy',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "14",
                'phone' => "08765432345",
                'email' => "navy@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0004',
                'full_name_kh' => 'ភូមិ មាស',
                'full_name_en' => 'Phom Meas',
                'first_name_kh' => 'ភូមិ',
                'last_name_kh' => 'មាស',
                'first_name_en' => 'Phom',
                'last_name_en' => 'Meas',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "15",
                'phone' => "08765432345",
                'email' => "meas@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0005',
                'full_name_kh' => 'សៀវ ស្រីណែត',
                'full_name_en' => 'Siev Sreyneath',
                'first_name_kh' => 'សៀវ ',
                'last_name_kh' => 'ស្រីណែត',
                'first_name_en' => 'Siev',
                'last_name_en' => 'Sreyneath',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "16",
                'phone' => "08765432345",
                'email' => "neath@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0005',
                'full_name_kh' => 'ម៉ាប់ ពិរុណ',
                'full_name_en' => 'Mab Piron',
                'first_name_kh' => 'ម៉ាប់ ',
                'last_name_kh' => 'ពិរុណ',
                'first_name_en' => 'Mab',
                'last_name_en' => 'Piron',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "17",
                'phone' => "08765432345",
                'email' => "piron@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0005',
                'full_name_kh' => 'ឡាយ សារឿន',
                'full_name_en' => 'Lay Saroeun',
                'first_name_kh' => 'ឡាយ ',
                'last_name_kh' => 'សារឿន',
                'first_name_en' => 'Lay',
                'last_name_en' => 'Saroeun',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "18",
                'phone' => "08765432345",
                'email' => "roeun@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0005',
                'full_name_kh' => 'លំអង ឡុង',
                'full_name_en' => 'Lomong Long',
                'first_name_kh' => 'លំអង',
                'last_name_kh' => 'ឡុង',
                'first_name_en' => 'Lomong',
                'last_name_en' => 'Long',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "19",
                'phone' => "08765432345",
                'email' => "Long@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0005',
                'full_name_kh' => 'ឯក សារិទ្ធ',
                'full_name_en' => 'Ek Sarith',
                'first_name_kh' => 'ឯក',
                'last_name_kh' => 'សារិទ្ធ',
                'first_name_en' => 'Ek',
                'last_name_en' => 'Sarith',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "20",
                'phone' => "08765432345",
                'email' => "Sarith@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0005',
                'full_name_kh' => 'សន ដាវ់ាន់',
                'full_name_en' => 'Sorn Davann',
                'first_name_kh' => 'សន',
                'last_name_kh' => 'ដាវ់ាន់',
                'first_name_en' => 'Sorn',
                'last_name_en' => 'Davann',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "20",
                'phone' => "08765432345",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
    }
}
