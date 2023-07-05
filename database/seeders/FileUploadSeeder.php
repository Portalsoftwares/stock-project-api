<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\UploadFile;

class FileUploadSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Teacher Image
        for ($i = 1; $i <= 10; $i++) {
            $name = "teacher" . $i;
            $file_path = "storage/uploads/" . $name . ".jpg";
            UploadFile::create([
                'name' => $name,
                'file_path' => $file_path,
                'size' => '2',
                'type' => 'jpg',
            ]);
        }
        //Student Image
        for ($i = 1; $i <= 10; $i++) {
            $name = "student" . $i;
            $file_path = "storage/uploads/" . $name . ".jpg";
            UploadFile::create([
                'name' => $name,
                'file_path' => $file_path,
                'size' => '2',
                'type' => 'jpg',
            ]);
        }
    }
}
