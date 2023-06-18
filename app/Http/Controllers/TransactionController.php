<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Http\Requests\Transaction\StoreRequest;
use App\Http\Requests\Transaction\UpdateRequest;
use App\Http\Resources\TransactionCollection;
use App\Http\Resources\TransactionResource;
use App\Services\TransactionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class TransactionController extends Controller
{
    public function __construct(
        protected readonly TransactionService $service,
    )
    {
    }

    final public function index(): TransactionCollection
    {
        return new TransactionCollection(resource: $this->service->list());
    }

    final public function store(StoreRequest $request): TransactionResource
    {
        $returnData = $this->service->store(dto: $request->dto());

        return new TransactionResource(resource: $returnData);
    }

    final public function show(string $id): TransactionResource
    {
        return new TransactionResource(resource: $this->service->show(id: $id));
    }

    final public function edit(string $id): TransactionResource
    {
        $returnData = $this->service->show(id: $id);

        return new TransactionResource(resource: $returnData);
    }

    final public function update(UpdateRequest $request, string $id): TransactionResource
    {
        $returnData = $this->service->update(dto: $request->dto(), id: $id);

        return new TransactionResource(resource: $returnData);
    }

    final public function destroy(string $id): JsonResponse
    {
        $this->service->delete(id: $id);

        return response()->json([
            'message' => 'success'
        ]);
    }

    final public function showUsersTransaction(int $id): AnonymousResourceCollection
    {
        return TransactionResource::collection(resource: $this->service->usersTransList(id: $id));
    }
}
