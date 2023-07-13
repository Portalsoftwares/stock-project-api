<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttendanceLine extends Model
{
    use HasFactory;
    protected $table = 'attendance_line';
    protected $fillable = [
        'attendance_id',
        'student_id',
        'attendance_type_id'
    ];

    public function attendance_type()
    {
        return $this->hasOne(AttendanceType::class, 'attendance_type_id', 'attendance_type_id');
    }
}
