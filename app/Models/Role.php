<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Permission\Models\Role as spatieRole;
use Spatie\Permission\Traits\HasPermissions;

class Role extends SpatieRole
{
    use HasFactory;
    use HasPermissions;
    protected $table = 'roles';
    protected $fillable = [
        'name',
        'guard_name',
    ];
}
