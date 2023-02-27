<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Term extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table ='terms';
    protected $dates = [ 'deleted_at' ];
    protected $fillable = [
        'name',
        'term',
        'description'
    ];
}