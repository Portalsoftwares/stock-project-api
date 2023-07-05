<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Day extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'day';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'day_id',
        'day_name_kh',
        'day_name_en',
    ];
}
