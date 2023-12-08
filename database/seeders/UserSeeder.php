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
            'name' => 'Super Admin',
            'phone' => '0956487667',
            'email' => 'admin@gmail.com',
            'is_system' => 1,
            'password' => bcrypt('dev123')
        ])->each(
            function ($user) {
                $user->assignRole('super-admin');
            }
        );
    }
}
