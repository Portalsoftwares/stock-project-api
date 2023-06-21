<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Teacher extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'teacher';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'teacher_id',
        'first_name_kh',
        'last_name_kh',
        'first_name_en',
        'last_name_en',
        'dob',
        'status'
    ];
}
