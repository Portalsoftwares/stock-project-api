<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GradeLevel extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'grade_level';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'grade_level_id',
        'grade_name',
        'grade_type',
        'academic_id',
        'class_type_id',
        'status'
    ];

    public function class_type()
    {
        return $this->hasOne(ClassType::class, 'class_type_id', 'class_type_id');
    }
    public function academic()
    {
        return $this->hasOne(Academic::class, 'academic_id', 'academic_id');
    }

    public function count_student_in_class()
    {
        return $this->hasMany(StudentClass::class, 'grade_level_id', 'grade_level_id');
    }
    public function get_teacher_in_class()
    {
        return $this->hasMany(TeacherClass::class, 'grade_level_id', 'grade_level_id');
    }
}
