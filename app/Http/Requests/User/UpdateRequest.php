<?php

declare(strict_types=1);

namespace App\Http\Requests\User;

use App\Dto\User\UpdateDto;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class UpdateRequest extends FormRequest
{
    final public function rules(): array
    {
        return [
            'name' => ['sometimes', 'alpha_dash', 'string', 'min:2', 'max:50'],
            'last_name' => ['sometimes', 'alpha_dash', 'string', 'min:2', 'max:50'],
            'email' => ['sometimes', 'string', 'email'],
            'password' => ['sometimes', 'string', 'confirmed',
                                Password::min(8)
                                    ->letters()
                                    ->mixedCase()
                                    ->numbers()
                                    ->symbols()
                                    ->uncompromised(),
            ],
            'phone' => ['sometimes', 'string', 'numeric'],
            'role' => ['sometimes', 'numeric', 'exists:users_roles_types,id'],
            'profile_image' => ['sometimes', 'image', 'mimes:jpg,png,jpeg,gif,svg', 'max:20480'],
        ];
    }

    final public function dto(): UpdateDto
    {
        return new UpdateDto(
            name: $this->input('name'),
            lastName: $this->input('last_name'),
            email: $this->input('email'),
            password: $this->input('password'),
            phone: (string)$this->input('phone'),
            role: (int)$this->input('role'),
            profileImage: $this->file('profile_image'),
        );
    }
}
