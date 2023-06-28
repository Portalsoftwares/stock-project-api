<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ScheduleClass extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'schedule_class';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'schedule_class_id',
        'grade_level_id',
    ];
    public function subject_schedule_day()
    {
        return $this->hasMany(SubjectScheduleDay::class, 'schedule_class_id', 'schedule_class_id');
    }
    public  function time()
    {
        return $this->hasOne(Time::class, 'id', 'time_id');
    }
}
