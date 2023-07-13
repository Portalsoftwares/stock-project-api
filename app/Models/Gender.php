<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gender extends Model
{
    use HasFactory;
    protected $table = 'gender';
    protected $fillable = [
        'gender_name_kh',
        'gender_name_en',
        'gender_sort_name_kh',
        'gender_sort_name_en'
    ];
}
