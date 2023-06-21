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
        'grade_level_id',
        'subject_id',
        'role',
    ];

    public function teacher_in_class()
    {
        return $this->hasOne(Teacher::class, 'teacher_id', 'teacher_id');
    }
    public function teacher_subject_in_class()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'subject_id');
    }
}
