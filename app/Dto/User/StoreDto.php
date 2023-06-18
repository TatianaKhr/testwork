<?php

declare(strict_types=1);

namespace App\Dto\User;

use Illuminate\Http\UploadedFile;

class StoreDto
{
    public function __construct(
        private readonly string       $name,
        private readonly string       $lastName,
        private readonly string       $email,
        private readonly string       $password,
        private readonly string       $phone,
        private readonly UploadedFile $profileImage)
    {
    }

    final public function getName(): string
    {
        return $this->name;
    }

    final public function getLastName(): string
    {
        return $this->lastName;
    }

    final public function getEmail(): string
    {
        return $this->email;
    }

    final public function getPassword(): string
    {
        return $this->password;
    }

    final public function getPhone(): string
    {
        return $this->phone;
    }

    final public function getProfileImage(): UploadedFile
    {
        return $this->profileImage;
    }
}
