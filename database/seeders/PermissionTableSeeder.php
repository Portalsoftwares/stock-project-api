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
            'class-info-manage-schedule',
            'class-info-add-teacher',
            'class-info-edit-teacher',
            'class-teacher',
            'class-student',
            'class-student-add',
            'class-student-remove',
            'class-attendance',
            'class-attendance-collect',
            'class-score',
            'class-score-collect',
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
        //Permissions
        $permissions_edit = [
            'user-view',
            'user-edit',
            'student-view',
            'student-edit',
            'subject-view',
            'subject-edit',
            'subject-level-view',
            'subject-level-edit',
            'class-view',
            'class-edit',
            'class-info',
            'class-info-manage-schedule',
            'class-info-edit-teacher',
            'class-teacher',
            'class-student',
            'class-attendance',
            'class-attendance-collect',
            'class-score',
            'class-score-collect',
            'exam-view',
            'exam-edit',
            'time-view',
            'time-edit',
            'academic-view',
            'academic-edit',
            'preference-score',
            'preference-attendance',
            'preference-view',
            'preference-update',
            'backup-view',
            'backup-restore',
            'role-permission-view',
            'role-permission-edit',
        ];
        $permissions_view = [
            'user-view',
            'student-view',
            'subject-view',
            'subject-level-view',
            'class-view',
            'class-info',
            'class-teacher',
            'class-student',
            'class-attendance',
            'class-score',
            'exam-view',
            'time-view',
            'academic-view',
            'preference-score',
            'preference-attendance',
            'preference-view',
            'backup-view',
            'role-permission-view',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }
    }
}
