<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;
    protected $table = 'attendance';
    protected $primaryKey = 'attendance_id';
    protected $fillable = [
        'time_id',
        'class_id',
        'day_id',
        'subject_grade_id',
        'teacher_id',
        'date',
    ];
    public function class()
    {
        return $this->hasOne(Classes::class, 'class_id', 'class_id');
    }
}
