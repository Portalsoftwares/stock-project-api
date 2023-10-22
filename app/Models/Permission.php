<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Permission\Models\Permission as spatiePermission;
use Spatie\Permission\Traits\HasRoles;

class Permission extends spatiePermission
{
    use HasFactory;
    use HasRoles;
    protected $table = 'permissions';
    protected $fillable = [
        'name',
        'guard_name',
    ];
}
