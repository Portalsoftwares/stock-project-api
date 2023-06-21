<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ClassType extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'class_type';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'class_type_id',
        'name',
        'note',
    ];

    public function student_in_class()
    {
    }
}
