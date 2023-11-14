<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Teacher extends Model
{
    use HasFactory, SoftDeletes;
    // use SoftDeletes;
    protected $table = 'teacher';
    protected $dates = ['deleted_at'];
    protected $primaryKey = "teacher_id";
    protected $fillable = [
        'teacher_id',
        'tid',
        'full_name_kh',
        'first_name_kh',
        'last_name_kh',
        'full_name_en',
        'first_name_en',
        'last_name_en',
        'date_of_birth',
        'gender_id',
        'teacher_level',
        'profession',
        'role',
        'join_date',
        'place_of_birth',
        'address',
        'status_id',
        'file_upload_id',
        'phone',
        'email',
        'is_enable_account',
        'other',
    ];
    public function gender()
    {
        return  $this->hasOne(Gender::class, 'gender_id', 'gender_id');
    }
    public function profile_img()
    {
        return $this->hasOne(UploadFile::class, 'file_upload_id', 'file_upload_id');
    }
    public function roles()
    {
        return $this->hasOne(TeacherRole::class, 'role_id', 'role');
    }
}