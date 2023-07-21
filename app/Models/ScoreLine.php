<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class scoreLine extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'score_line';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'score_id',
        'student_id',
        'mark'
    ];
}
