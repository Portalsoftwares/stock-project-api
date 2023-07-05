<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Schedule extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'schedule';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'schedule_id',
        'class_id',
    ];
    public function subject_schedule_day()
    {
        return $this->hasMany(ScheduleLine::class, 'schedule_id', 'schedule_id');
    }
    public  function time()
    {
        return $this->hasOne(Time::class, 'id', 'time_id');
    }
}
