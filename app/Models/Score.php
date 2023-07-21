<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class score extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'score';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'class_id',
        'score_type_id',
        'subject_grade_id',
    ];
}
