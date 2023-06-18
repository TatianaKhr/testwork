<?php

declare(strict_types=1);

namespace App\Services;

use App\Dto\User\StoreDto;
use App\Dto\User\UpdateDto;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserRoleType;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UserService
{
    public function __construct(
        private readonly Hash    $hash,
        private readonly Storage $storage,
        private readonly User    $user,
        private readonly UserRoleType $role,
    )
    {
    }

    final public function store(StoreDto $dto): User
    {
        return $this->user->create([
            'name' => $dto->getName(),
            'last_name' => $dto->getLastName(),
            'email' => $dto->getEmail(),
            'password' => $this->hash::make($dto->getPassword()),
            'phone' => $dto->getPhone(),
            'profile_image' => $this->storeImage($dto->getProfileImage()),
        ]);
    }

    final public function update(UpdateDto $dto, int $id): User
    {
        $user = $this->user->find(id: $id);
        $userAttributes = array_map('strval', ($this->user)->getFillable());
        $fieldsToUpdate = ['role' => 'getRole'];

        foreach ($userAttributes as $attribute) {
            $normalizedAttribute = lcfirst(str_replace('_', '', ucwords($attribute, '_')));
            $method = 'get' . ucfirst($normalizedAttribute);
            $fieldsToUpdate[$attribute] = $method;
        }

        $data = [];

        foreach ($fieldsToUpdate as $attribute => $getterMethod) {
            $value = $dto->$getterMethod();

            if (!is_null($value)) {
                if ($attribute === 'password') {
                    $data[$attribute] = $this->hash::make($value);

                } elseif ($attribute === 'profile_image') {
                    if ($user->profile_image) {
                        $this->storage::delete('public/images/user' . $user->profile_image);
                    }

                    $data[$attribute] = $this->storeImage($value);
                } else {
                    $data[$attribute] = $value;
                }
            }
        }

        if (!empty($data)) {
            $user->fill($data)->save();
        }

        if (isset($data['role'])) {
            $user->roles()->sync($data['role']);
        }

        return $user;
    }

    final public function show(int $id): User
    {
        return $this->user->find($id);
    }

    final public function edit(int $id): array
    {
        return  [
            'user' => $this->user::with('roles')->find($id),
            'usersRoles' => $this->role::all(),
        ];
    }

    final public function delete(int $id): int
    {
        return $this->user->destroy($id);
    }


    public function storeImage(object $file): string
    {
        return $this->storage::disk('public')->put('/images/users', $file);
    }

    final public function userWithTransaction(int $id): User
    {
        return User::with(['transactions' => function ($query) {
            $query->orderBy('created_at', 'desc')->take(5);
        }])->find($id);
    }
}
