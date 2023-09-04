<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'វ៉ាន់ ស៊ីវម៉ី',
            'teacher_id' => '1',
            'phone' => '0956487667',
            'email' => 'vannmey@gmail.com',
            'file_upload_id' => '1',
            'password' => bcrypt('dev123')
        ])->each(
            function ($user) {
                $user->assignRole('super-admin');
            }
        );
        User::create([
            'name' => 'សុខ សាន្ត វណ្ណា',
            'teacher_id' => '2',
            'phone' => '0956487667',
            'email' => 'sanvanna@gmail.com',
            'file_upload_id' => '2',
            'password' => bcrypt('dev123')
        ])->each(
            function ($user) {
                $user->assignRole('role-editor');
            }
        );
        User::create([
            'name' => 'កែវ ចន្ទវត្តី',
            'teacher_id' => '3',
            'phone' => '0956487667',
            'email' => 'chanvettey@gmail.com',
            'file_upload_id' => '3',
            'password' => bcrypt('dev123')
        ])->each(
            function ($user) {
                $user->assignRole('role-viewer');
            }
        );
    }
}
