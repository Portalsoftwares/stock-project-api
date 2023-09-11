<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;
    protected $table = 'attendance';
    protected $fillable = [
        'time_id',
        'class_id',
        'day_id',
        'subject_grade_id',
        'teacher_id',
        'date',
    ];
}
