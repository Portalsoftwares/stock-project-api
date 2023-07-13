<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Student extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'student';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'student_id',
        'first_name_kh',
        'last_name_kh',
        'first_name_en',
        'last_name_en',
        'date_of_birth',
        'file_upload_id',
        'gender_id',
        'status_id',
        'phone',
        'email',
        'address',
        'place_of_birth',
        'other',
    ];
    public function current_class()
    {
        return   $this->belongsTo(StudentClass::class, 'student_id', 'student_id');
    }
    public function gender()
    {
        return   $this->hasOne(Gender::class, 'gender_id', 'gender_id');
    }
    public function status()
    {
        return   $this->hasOne(StudentStatus::class, 'status_id', 'status_id');
    }
    public function profile_img()
    {
        return $this->hasOne(UploadFile::class, 'file_upload_id', 'file_upload_id');
    }
}
