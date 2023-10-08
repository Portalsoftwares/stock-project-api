<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonalAccessTokenn extends Model
{
    use HasFactory;
    protected $table = 'personal_access_tokens';
    protected $fillable = [
        'last_used_at',
    ];
}
