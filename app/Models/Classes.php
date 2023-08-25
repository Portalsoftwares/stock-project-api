<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Classes extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'class';
    protected $dates = ['deleted_at'];
    protected $primaryKey = 'class_id';
    protected $fillable = [
        'class_id',
        'class_name',
        'class_type_id',
        'grade_level_id',
        'academic_id',
        'other'
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
        return $this->hasMany(StudentClass::class, 'class_id', 'class_id');
    }
    public function get_teacher_in_class()
    {
        return $this->hasMany(TeacherClass::class, 'class_id', 'class_id');
    }
}
