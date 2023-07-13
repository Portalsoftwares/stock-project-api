<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudentClass extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'student_class';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'student_id',
        'class_id',
        'from_class_id',
        'is_duplicate',
        'from_secondary_high_school',
        'secondary_exam_date',
        'secondary_exam_place',
        'secondary_exam_room',
        'secondary_exam_desk',
        'role_id',
    ];

    public function student_in_class()
    {
        return $this->hasOne(Student::class, 'student_id', 'student_id');
    }
    public function class()
    {
        return $this->hasOne(Classes::class, 'class_id', 'class_id');
    }
    public function role()
    {
        return   $this->hasOne(StudentRole::class, 'role_id', 'role_id');
    }
    public function attendanceLine()
    {
        return $this->hasMany(AttendanceLine::class, 'student_id', 'student_id');
    }
}