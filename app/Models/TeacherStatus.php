<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeacherStatus extends Model
{
    use HasFactory;
    protected $table = 'teacher_status';
    protected $fillable = [
        'status_kh',
        'status_en',
        'color'
    ];
}
