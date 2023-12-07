<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TeacherClass extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'teacher_class';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'teacher_id',
        'class_id',
        'subject_grade_id',
        'role_id',
    ];

    public function teacher_in_class()
    {
        return $this->hasOne(Teacher::class, 'teacher_id', 'teacher_id');
    }

    public function class(){
        return $this->hasOne(Classes::class, 'class_id', 'class_id');

    }
    public function teacher_subject_in_class()
    {
        return $this->hasOne(SubjectGradeLevel::class, 'subject_grade_id', 'subject_grade_id');
    }
}
