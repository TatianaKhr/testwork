<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection extends ResourceCollection
{

    public $collects = UserResource::class;

    final public function toArray($request): array
    {
        return [
            'data' => $this->collection,
        ];
    }
}
