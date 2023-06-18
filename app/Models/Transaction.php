<?php

declare(strict_types=1);

namespace App\Models;

use DateTime;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Concerns\HasUlids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Carbon;

class Transaction extends Model
{
    use HasFactory;
    use SoftDeletes;
    use HasUlids;

    protected $table = 'transactions';

    protected $fillable = [
        'type',
        'sum',
        'user_id',
        'date_of_transaction',
    ];

    protected function dateOfTransaction(): Attribute
    {
        return Attribute::make(
            get: fn (DateTime|string $value) => Carbon::parse($value)->format('Y-m-d H:i'),
        );
    }

    final public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function scopeGetByUserId($query, int $id): Builder
    {
        return $query->where('user_id', '=', $id);
    }
}
