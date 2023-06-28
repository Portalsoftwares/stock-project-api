<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Student extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'student';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'student_id',
        'first_name_kh',
        'last_name_kh',
        'first_name_en',
        'last_name_en',
        'dob',
        'status'
    ];
    public function current_class()
    {
        return   $this->belongsTo(StudentClass::class, 'student_id', 'student_id');
    }
}
