<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class scoreType extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table = 'score_type';
    protected $dates = ['deleted_at'];
    protected $primaryKey = 'score_type_id';
    protected $fillable = [
        'name',
        'date',
    ];
}
