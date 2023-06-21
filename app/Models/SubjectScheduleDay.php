<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubjectScheduleDay extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'subject_day_schedule';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'schedule_class_id',
        'subject_id',
        'time_id',
        'day_id',
    ];
    public function time()
    {
        return $this->hasOne(Time::class, 'id', 'time_id');
    }
    public function day()
    {
        return $this->hasOne(Day::class, 'id', 'day_id');
    }
    public function subject()
    {
        return $this->hasOne(Subject::class, 'subject_id', 'subject_id');
    }
}
