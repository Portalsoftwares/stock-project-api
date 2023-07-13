<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentRole extends Model
{
    use HasFactory;
    protected $table = 'student_role';
    protected $fillable = [
        'name',
    ];
}