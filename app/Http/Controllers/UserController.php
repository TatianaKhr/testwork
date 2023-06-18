<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Http\Requests\User\StoreRequest;
use App\Http\Requests\User\UpdateRequest;
use App\Http\Resources\UserCollection;
use App\Http\Resources\UserResource;
use App\Models\User;
use App\Models\UserRoleType;
use App\Services\UserService;
use Illuminate\Http\JsonResponse;
use Illuminate\View\View;

class UserController extends Controller
{
    final public function __construct(
        protected readonly UserService $service
    )
    {
    }

    public function indexView()
    {
        $users = User::orderBy('id', 'DESC')->paginate(15);

        $data = [
            'users' => $users,
        ];

        return view('users.index', $data);
    }

    public function index(): UserCollection
    {
        $returnData = User::all();

        return new UserCollection(resource: $returnData);
    }

    final public function usersList(int $id): UserResource
    {
        $usersTransaction = $this->service->userWithTransaction(id: $id);

        return new UserResource(resource: $usersTransaction);
    }

    public function store(StoreRequest $request): UserResource
    {
        $returnData = $this->service->store(dto: $request->dto());

        return new UserResource(resource: $returnData);
    }

    public function edit(int $id): View
    {
        return view('users.edit',$this->service->edit(id: $id));
    }

    public function update(UpdateRequest $request, int $id): UserResource
    {
        $returnData = $this->service->update(dto: $request->dto(), id: $id);

        return new UserResource(resource: $returnData);
    }

    public function destroy(int $id): JsonResponse
    {
        $this->service->delete(id: $id);

        return response()->json([
            'message' => 'success'
        ]);
    }
}
