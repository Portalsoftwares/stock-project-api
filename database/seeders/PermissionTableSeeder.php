<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Permissions
        $permissions = [
            'user-view',
            'user-create',
            'user-edit',
            'user-delete',
            'student-view',
            'student-create',
            'student-edit',
            'student-delete',
            'subject-view',
            'subject-create',
            'subject-edit',
            'subject-delete',
            'subject-level-view',
            'subject-level-create',
            'subject-level-edit',
            'subject-level-delete',
            'class-view',
            'class-create',
            'class-edit',
            'class-delete',
            'class-info',
            'class-teacher',
            'class-student',
            'class-attendance',
            'class-score',
            'exam-view',
            'exam-create',
            'exam-edit',
            'exam-delete',
            'time-view',
            'time-create',
            'time-edit',
            'time-delete',
            'academic-view',
            'academic-create',
            'academic-edit',
            'academic-delete',
            'preference-score',
            'preference-attendance',
            'preference-view',
            'preference-update',
            'backup-view',
            'backup-create',
            'backup-restore',
            'backup-delete',
            'role-permission-view',
            'role-permission-create',
            'role-permission-edit',
            'role-permission-delete'
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }
    }
}
