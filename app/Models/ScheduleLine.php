<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ScheduleLine extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'schedule_line';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'schedule_id',
        'time_id',
        'day_id',
        'subject_grade_id',
    ];
    public function time()
    {
        return $this->hasOne(Time::class, 'time_id', 'time_id');
    }
    public function day()
    {
        return $this->hasOne(Day::class, 'day_id', 'day_id');
    }
    public function subject()
    {
        return $this->hasOne(SubjectGradeLevel::class, 'subject_grade_id', 'subject_grade_id');
    }
}
