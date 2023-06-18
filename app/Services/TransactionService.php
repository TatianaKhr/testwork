<?php

declare(strict_types=1);

namespace App\Services;

use App\Dto\Transaction\StoreDto;
use App\Dto\Transaction\UpdateDto;
use App\Models\Transaction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

 class TransactionService
{
    public function __construct(
        private readonly Transaction $transaction,
    )
    {
    }

    final public function list(): LengthAwarePaginator
    {
        return $this->transaction->paginate(15);
    }

    final public function store(StoreDto $dto): Transaction
    {
        return $this->transaction->create([
            'user_id' => $dto->getUserId(),
            'type' => $dto->getType(),
            'sum' => $dto->getSum(),
            'date_of_transaction' => $dto->getDateOfTransaction()
        ]);
    }

    final public function show(string $id): Transaction
    {
        return $this->transaction->find(id: $id);
    }

    final public function update(UpdateDto $dto, string $id): Transaction
    {
        $transaction = $this->show(id: $id);

        $transaction->fill([
            'user_id' => $dto->getUserId(),
            'type' => $dto->getType(),
            'sum' => $dto->getSum(),
            'date_of_transaction' => $dto->getDateOfTransaction()
        ])->save();

        return $transaction;
    }

    final public function delete(string $id): int
    {
        return $this->transaction->destroy($id);
    }

    final public function usersTransList(int $id): Collection
    {
        return $this->transaction->getByUserId(id: $id)
            ->latest()
            ->take(5)
            ->get();
    }
}
