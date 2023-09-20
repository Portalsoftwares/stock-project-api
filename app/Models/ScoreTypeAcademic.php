<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class scoreTypeAcademic extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table = 'score_type_academic';
    protected $dates = ['deleted_at'];
    protected $primaryKey = 'id';
    protected $fillable = [
        'academic_id',
        'under_score_type_id',
        'semester_id',
    ];

    public function academic()
    {
        return $this->hasOne(Academic::class, 'academic_id', 'academic_id');
    }

    public function semester()
    {
        return $this->hasOne(scoreType::class, 'score_type_id', 'semester_id');
    }
}
