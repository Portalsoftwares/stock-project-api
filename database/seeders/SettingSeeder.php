<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Setting;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Setting::create([
            'name' => 'វិទ្យាល័យចំណេះទូទៅនិងបច្ចេកទេសពួក',
            'phone' => '',
            'email' => '',
            'logo' => '',
            'address' => '',
            'backup_type' => 1,         //1-daily 2-weekly 3-monthly 4-yealy
            'backup_time' => '12:00',   //time :12:00
        ]);
    }
}
