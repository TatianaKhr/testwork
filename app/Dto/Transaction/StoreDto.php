<?php

declare(strict_types=1);

namespace App\Dto\Transaction;

use DateTimeInterface;

class StoreDto
{
    public function __construct(
        private readonly int               $type,
        private readonly float             $sum,
        private readonly int               $userId,
        private readonly DateTimeInterface $dateOfTransaction)
    {
    }

    final public function getType(): int
    {
        return $this->type;
    }

    final public function getSum(): float|int
    {
        return $this->sum;
    }

    final public function getUserId(): int
    {
        return $this->userId;
    }

    final public function getDateOfTransaction(): DateTimeInterface
    {
        return $this->dateOfTransaction;
    }
}
