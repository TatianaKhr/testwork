<?php

declare(strict_types=1);

namespace App\Http\Requests\Transaction;

use App\Dto\Transaction\StoreDto;
use Carbon\Carbon;
use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    final public function rules(): array
    {
        return [
            'type' => ['required', 'integer'],
            'sum' => ['required', 'regex:/^\d+(\.\d{1,2})?$/', 'min:0'],
            'user_id' => ['required', 'int', 'exists:users,id'],
            'date_of_transaction' => ['required', 'date', 'after:today']
        ];
    }

    final public function dto(): StoreDto
    {
        return new StoreDto(
            type: (int)$this->input('type'),
            sum: (float)$this->input('sum'),
            userId: $this->input('user_id'),
            dateOfTransaction: Carbon::parse($this->input('date_of_transaction'))->toDateTime(),
        );
    }
}
