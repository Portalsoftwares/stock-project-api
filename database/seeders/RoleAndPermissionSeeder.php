<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleAndPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
        // User

        // Role
        $superAdmin = 'super-admin';
        $editor = 'role-editor';
        $viewer = 'role-viewer';
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
        Role::create(['name' => $superAdmin])->givePermissionTo(Permission::all());
        Role::create(['name' => $editor])->givePermissionTo($permissions_edit);
        Role::create(['name' => $viewer])->givePermissionTo($permissions_view);
    }
}
