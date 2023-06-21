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
        'grade_level_id',
        'role',

    ];

    public function student_in_class()
    {
        return $this->hasOne(Student::class, 'student_id', 'student_id');
    }
}
