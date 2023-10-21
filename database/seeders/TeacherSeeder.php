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
                'tid' => 'PK-T0002',
                'full_name_kh' => 'វាន់ ស៊ីវម៉ី',
                'full_name_en' => 'Van Sivmey',
                'first_name_kh' => 'វាន់',
                'last_name_kh' => 'ស៊ីវម៉ី',
                'first_name_en' => 'Van',
                'last_name_en' => 'Sivmey',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "1",
                'phone' => "08765432345",
                'email' => "sivmey@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0003',
                'full_name_kh' => 'សុខ សាន្ត',
                'full_name_en' => 'vana sok san',
                'first_name_kh' => 'សុខ សាន្ត វណ្ណា',
                'last_name_kh' => 'វណ្ណា',
                'first_name_en' => 'sok san',
                'last_name_en' => 'vana',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "2",
                'phone' => "08765432345",
                'email' => "soksan@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0004',
                'full_name_kh' => 'កែវ ចន្ទវត្តី',
                'full_name_en' => 'keo chanvettey',
                'first_name_kh' => 'កែវ',
                'last_name_kh' => 'ចន្ទវត្តី',
                'first_name_en' => 'keo',
                'last_name_en' => 'chanvettey',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "3",
                'phone' => "08765432345",
                'email' => "chanvettey@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0005',
                'full_name_kh' => 'គីម សុភារី',
                'full_name_en' => 'kim sopheary',
                'first_name_kh' => 'គីម',
                'last_name_kh' => 'សុភារី',
                'first_name_en' => 'kim',
                'last_name_en' => 'sopheary',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "4",
                'phone' => "08765432345",
                'email' => "sopheary@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0006',
                'full_name_kh' => 'ទេព ទេវី',
                'full_name_en' => 'teb tevy',
                'first_name_kh' => 'ទេព',
                'last_name_kh' => 'ទេវី',
                'first_name_en' => 'teb',
                'last_name_en' => 'tevy',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "5",
                'phone' => "08765432345",
                'email' => "tevy@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0007',
                'full_name_kh' => 'ម្លិះរួត មល្លិកា',
                'full_name_en' => 'mlekrout milekka',
                'first_name_kh' => 'ម្លិះរួត',
                'last_name_kh' => 'មល្លិកា',
                'first_name_en' => 'mlekrout',
                'last_name_en' => 'milekka',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "6",
                'phone' => "08765432345",
                'email' => "milekka@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0008',
                'full_name_kh' => 'សាល តារារស្មី',
                'full_name_en' => 'sal darareaksmey',
                'first_name_kh' => 'សាល',
                'last_name_kh' => 'តារារស្មី',
                'first_name_en' => 'sal',
                'last_name_en' => 'darareaksmey',
                'date_of_birth' => '2003-01-07',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "7",
                'phone' => "08765432345",
                'email' => "darareaksmey@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0008',
                'full_name_kh' => 'នាង សុជាតា',
                'full_name_en' => 'neng socheata',
                'first_name_kh' => 'នាង',
                'last_name_kh' => 'សុជាតា',
                'first_name_en' => 'neng',
                'last_name_en' => 'socheata',
                'date_of_birth' => '2003-01-08',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "8",
                'phone' => "08765432345",
                'email' => "socheata@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0009',
                'full_name_kh' => 'រិន បុរី',
                'full_name_en' => 'rin borey',
                'first_name_kh' => 'រិន',
                'last_name_kh' => 'បុរី',
                'first_name_en' => 'rin',
                'last_name_en' => 'borey',
                'date_of_birth' => '01-01-2003',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2003-01-09",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "9",
                'phone' => "08765432345",
                'email' => "borey@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
        Teacher::create(
            [
                'tid' => 'PK-T0010',
                'full_name_kh' => 'មាលី មាលា',
                'full_name_en' => 'Maly Melea',
                'first_name_kh' => 'មាលី',
                'last_name_kh' => 'មាលា',
                'first_name_en' => 'Maly',
                'last_name_en' => 'Melea',
                'date_of_birth' => '2003-01-10',
                'gender_id' =>  "1",
                'teacher_level' => "2",
                'profession' => "1,2",
                'role' => "8",
                'join_date' => "2023-09-08",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "10",
                'phone' => "08765432345",
                'email' => "Melea@gmail.com",
                'is_enable_account' => "0",
                'other' => ''
            ]
        );
    }
}
