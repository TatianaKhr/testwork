<?php

declare(strict_types=1);

namespace App\Dto\User;

use Illuminate\Http\UploadedFile;

class UpdateDto
{
    public function __construct(
        private readonly string|null       $name,
        private readonly string|null       $lastName,
        private readonly string|null       $email,
        private readonly string|null       $password,
        private readonly string|null       $phone,
        private readonly int|null          $role,
        private readonly UploadedFile|null $profileImage)
    {
    }

    final public function getName(): string|null
    {
        return $this->name;
    }

    final public function getLastName(): string|null
    {
        return $this->lastName;
    }

    final public function getEmail(): string|null
    {
        return $this->email;
    }

    final public function getPassword(): string|null
    {
        return $this->password;
    }

    final public function getPhone(): string|null
    {
        return $this->phone;
    }

    final public function getRole(): int|null
    {
        return $this->role;
    }

    final public function getProfileImage(): UploadedFile|null
    {
        return $this->profileImage;
    }
}
