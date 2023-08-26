<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubjectGradeLevel extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'subject_grade_level';
    protected $primaryKey = "subject_grade_id";
    protected $dates = ['deleted_at'];
    protected $fillable = [
        'subject_grade_id',
        'grade_level_id',
        'subject_id',
        'class_type_id',
        'full_score',
        'divide',
        'average',
    ];
    public function subject()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'subject_id');
    }
    public function grade_level()
    {
        return $this->hasOne(GradeLevel::class, 'grade_level_id', 'grade_level_id');
    }
    public function class_type()
    {
        return $this->hasOne(ClassType::class, 'class_type_id', 'class_type_id');
    }
}
