<?php

declare(strict_types=1);

namespace App\Dto\Transaction;

use DateTimeInterface;

class UpdateDto
{
    public function __construct(
        private readonly int               $type,
        private readonly float             $sum,
        private readonly int               $userId,
        private readonly DateTimeInterface $dateOfTransaction
    )
    {
    }

    final public function getType(): int|null
    {
        return $this->type;
    }

    final public function getSum(): float|int|null
    {
        return $this->sum;
    }

    final public function getUserId(): int|null
    {
        return $this->userId;
    }

    final public function getDateOfTransaction(): DateTimeInterface|null
    {
        return $this->dateOfTransaction;
    }
}
