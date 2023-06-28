<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Time extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'time';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'name',
        'start_date',
        'end_date',
    ];
    public function getSchedule()
    {
        return $this->hasMany(SubjectScheduleDay::class, 'time_id', 'id');
    }
}
