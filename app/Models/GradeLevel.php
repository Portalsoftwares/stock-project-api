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
        'grade_level_name',
    ];
}
