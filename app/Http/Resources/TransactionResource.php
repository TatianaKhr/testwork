<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TransactionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'type' => $this->type,
            'sum' => $this->sum,
            'user_id' => $this->user_id,
            'date_of_transaction' => $this->date_of_transaction,
        ];
    }
}
