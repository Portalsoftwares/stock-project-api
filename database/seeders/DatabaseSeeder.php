<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            FileUploadSeeder::class,
            PermissionTableSeeder::class,
            RoleAndPermissionSeeder::class,
            UserSeeder::class,
            TimeSeeder::class,
            DaySeeder::class,
            SubjectSeeder::class,
            StudentSeeder::class,
            TeacherSeeder::class,
            TeacherStatusSeeder::class,
            StudentStatusSeeder::class,
            GenderSeeder::class,
            ClassTypeSeeder::class,
            AttendanceTypeSeeder::class,
            GradeLevelSeeder::class,
            AcademicSeeder::class,
            TeacherRoleSeeder::class,
            StudentRoleSeeder::class,
            ScoreTypeSeeder::class,
            SettingSeeder::class,
        ]);
    }
}
