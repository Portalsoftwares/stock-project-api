<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Time extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table = 'time';
    protected $primaryKey = 'time_id';
    protected $dates = ['deleted_at'];
    protected $fillable = [
        'time_id',
        'name',
        'start_date',
        'end_date',
    ];
    public function getSchedule()
    {
        return $this->hasMany(ScheduleLine::class, 'time_id', 'time_id');
    }
}
