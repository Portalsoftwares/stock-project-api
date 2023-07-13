<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeacherRole extends Model
{
    use HasFactory;
    protected $table = 'teacher_role';
    protected $fillable = [
        'name',
    ];
}
