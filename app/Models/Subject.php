<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subject extends Model
{
    use HasFactory, SoftDeletes;
    // use SoftDeletes;
    protected $table = 'subject';
    protected $dates = ['deleted_at'];
    protected $primaryKey = "subject_id";
    protected $fillable = [
        'subject_id',
        'subject_name_kh',
        'subject_name_en',
        'subject_sort_name_en',
    ];
}
