<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subject extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'subject';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'subject_id',
        'name_kh',
        'name_en',
    ];
}
