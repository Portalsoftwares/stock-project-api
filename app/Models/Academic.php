<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Academic extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'academic';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'academic_id',
        'academic_name',
        'start_date',
        'end_date',
    ];

    public function student_in_class()
    {
    }
}
