<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Teacher extends Model
{
    use HasFactory;
    // use SoftDeletes;
    protected $table = 'teacher';
    // protected $dates = ['deleted_at'];
    protected $fillable = [
        'teacher_id',
        'first_name_kh',
        'last_name_kh',
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
    public function profile_img()
    {
        return $this->hasOne(UploadFile::class, 'file_upload_id', 'file_upload_id');
    }
}
