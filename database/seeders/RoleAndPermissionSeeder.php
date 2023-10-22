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
        Role::create(['name' => $superAdmin])->givePermissionTo(Permission::all());
        Role::create(['name' => $editor])->givePermissionTo([]);
        Role::create(['name' => $viewer])->givePermissionTo([]);
    }
}
