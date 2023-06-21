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
        'time_id',
        'day1_subject_id',
        'day2_subject_id',
        'day3_subject_id',
        'day4_subject_id',
        'day5_subject_id',
        'day6_subject_id',
        'day7_subject_id',
    ];

    public function subject_schedule_day()
    {
        return $this->hasMany(SubjectScheduleDay::class, 'schedule_class_id', 'schedule_class_id');
    }
    public  function time()
    {
        return $this->hasOne(Time::class, 'id', 'time_id');
    }
    public  function subject_day1()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day1_subject_id');
    }
    public  function subject_day2()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day2_subject_id');
    }
    public  function subject_day3()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day3_subject_id');
    }
    public  function subject_day4()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day4_subject_id');
    }
    public  function subject_day5()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day5_subject_id');
    }
    public  function subject_day6()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day6_subject_id');
    }
    public  function subject_day7()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'day7_subject_id');
    }
}
