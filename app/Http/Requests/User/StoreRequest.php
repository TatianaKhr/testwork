<?php

declare(strict_types=1);

namespace App\Http\Requests\User;

use App\Dto\User\StoreDto;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class StoreRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    final public function rules(): array
    {
        return [
            'name' => ['required', 'alpha_dash', 'string', 'min:3', 'max:50'],
            'last_name' => ['required', 'alpha_dash', 'string', 'min:3', 'max:50'],
            'email' => ['required', 'string', 'email'],
            'password' => ['required', 'string', 'confirmed',
                                Password::min(8)
                                    ->letters()
                                    ->mixedCase()
                                    ->numbers()
                                    ->symbols()
                                    ->uncompromised(),
            ],
            'phone' => ['required', 'string', 'numeric'],
            'profile_image' => ['required', 'image', 'mimes:jpg,png,jpeg,gif,svg', 'max:20480'],
        ];
    }

    final public function dto(): StoreDto
    {
        return new StoreDto(
            name: $this->input('name'),
            lastName: $this->input('last_name'),
            email: $this->input('email'),
            password: $this->input('password'),
            phone: (string)$this->input('phone'),
            profileImage: $this->file('profile_image'),
        );
    }
}
