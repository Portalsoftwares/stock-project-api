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
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "12",
                'phone' => "03951706824",
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
                'phone' => "02187653094",
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
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "14",
                'phone' => "08742053169",
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
                'phone' => "06309251784",
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
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'file_upload_id' => "16",
                'phone' => "04956873210",
                'email' => "neath@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0006',
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
                'phone' => "07132485096",
                'email' => "piron@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0007',
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
                'phone' => "08294761053",
                'email' => "roeun@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0008',
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
                'phone' => "05601928374",
                'email' => "Long@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0009',
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
                'phone' => "03872405169",
                'email' => "Sarith@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0010',
                'full_name_kh' => 'សោន សៀវផាច',
                'full_name_en' => 'san sievpatch',
                'first_name_kh' => 'សោន',
                'last_name_kh' => 'សៀវផាច',
                'first_name_en' => 'san',
                'last_name_en' => 'sievpatch',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "01246357890",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0011',
                'full_name_kh' => 'មាស ឆាយ៉ា',
                'full_name_en' => 'Meas Chariya',
                'first_name_kh' => 'មាស',
                'last_name_kh' => 'ឆាយ៉ា',
                'first_name_en' => 'Meas',
                'last_name_en' => 'Chariya',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "09052746183",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0012',
                'full_name_kh' => 'ផុន រិតសាក',
                'full_name_en' => 'Phon Rithisak',
                'first_name_kh' => 'ផុន',
                'last_name_kh' => 'រិតសាក',
                'first_name_en' => 'Phon',
                'last_name_en' => 'Rithisak',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "06798154320",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0013',
                'full_name_kh' => 'អុក សារីន',
                'full_name_en' => 'Ok Samrin',
                'first_name_kh' => 'អុក',
                'last_name_kh' => 'សារីន',
                'first_name_en' => 'Ok',
                'last_name_en' => 'Samrin',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "03184592067",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0014',
                'full_name_kh' => 'ហេង បូណា',
                'full_name_en' => 'Heang Bona',
                'first_name_kh' => 'ហេង',
                'last_name_kh' => 'បូណា',
                'first_name_en' => 'Heang',
                'last_name_en' => 'Bona',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "05426873019",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0014',
                'full_name_kh' => 'អីវ ដារានី',
                'full_name_en' => 'Iv Darany',
                'first_name_kh' => 'មាស',
                'last_name_kh' => 'ឆាយ៉ា',
                'first_name_en' => 'Iv',
                'last_name_en' => 'Darany',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "07652301984",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0016',
                'full_name_kh' => 'នោន សុធារិត',
                'full_name_en' => 'Nourn Sotearith',
                'first_name_kh' => 'នោន',
                'last_name_kh' => 'សុធារិត',
                'first_name_en' => 'Nourn',
                'last_name_en' => 'Sotearith',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "01406975283",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0017',
                'full_name_kh' => 'សង់ ចក្រា',
                'full_name_en' => 'Song Chakra',
                'first_name_kh' => 'មាស',
                'last_name_kh' => 'ឆាយ៉ា',
                'first_name_en' => 'Song',
                'last_name_en' => 'Chakra',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "09823470156",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0018',
                'full_name_kh' => 'ចិន រតនា',
                'full_name_en' => 'Chin Rotha',
                'first_name_kh' => 'ចិន',
                'last_name_kh' => 'រតនា',
                'first_name_en' => 'Chin',
                'last_name_en' => 'Rotha',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "03562081974",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0019',
                'full_name_kh' => 'សាន ភក្ដី',
                'full_name_en' => 'San Pheakkley',
                'first_name_kh' => 'សាន',
                'last_name_kh' => 'ភក្ដី',
                'first_name_en' => 'San',
                'last_name_en' => 'Pheakkley',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "08740563219",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0020',
                'full_name_kh' => 'រស់ ដាវី',
                'full_name_en' => 'Rous Daevy',
                'first_name_kh' => 'រស់',
                'last_name_kh' => 'ដាវី',
                'first_name_en' => 'Rous',
                'last_name_en' => 'Daevy',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "06198342750",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0021',
                'full_name_kh' => 'សម វាសនា',
                'full_name_en' => 'Som Veasna',
                'first_name_kh' => 'សម',
                'last_name_kh' => 'វាសនា',
                'first_name_en' => 'Som',
                'last_name_en' => 'Veasna',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "05032167894",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0022',
                'full_name_kh' => 'សៀង សុជាតិ',
                'full_name_en' => 'Sieng Socheat',
                'first_name_kh' => 'សៀង',
                'last_name_kh' => 'សុជាតិ',
                'first_name_en' => 'Sieng',
                'last_name_en' => 'Socheat',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "02918475036",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0023',
                'full_name_kh' => 'ម៉េង សុរិយា',
                'full_name_en' => 'Meng Sorya',
                'first_name_kh' => 'ម៉េង',
                'last_name_kh' => 'សុរិយា',
                'first_name_en' => 'Meng',
                'last_name_en' => 'Sorya',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "2",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "04289056137",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
        Student::create(
            [
                'sid' => 'PK-S0024',
                'full_name_kh' => 'ឈៀន រំចង់',
                'full_name_en' => 'Choem Roumjong',
                'first_name_kh' => 'ឈៀន',
                'last_name_kh' => 'រំចង់',
                'first_name_en' => 'Choem',
                'last_name_en' => 'Roumjong',
                'date_of_birth' => '2003-01-01',
                'gender_id' =>  "1",
                'place_of_birth' => "siem reap",
                'address' => "siem reap",
                'status_id' => "1",
                'phone' => "07650321984",
                'email' => "Davann@gmail.com",
                'other' => ''
            ]
        );
    }
}
