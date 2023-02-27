<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ActivationLine extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table ='activation_lines';
    protected $dates = [ 'deleted_at' ];
    protected $fillable = [
        'activation_id',
        'product_id',
        'term_id',
        'period',
        'user_no',
        'activated_date',
        'expired_date',
        'status',
        'note',
        'order_by',
        'is_notify_email',
        'is_free',
        'is_active'
    ];
}