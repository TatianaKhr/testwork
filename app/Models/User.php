<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'last_name',
        'email',
        'password',
        'phone',
        'profile_image',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getTitleAttribute()
    {
        return ($this->last_name && $this->name) ? $this->last_name . ' ' . $this->name : $this->phone;
    }

    public function isRoot()
    {
        return $this->id == 1;
    }

    public function isSuperAdmin()
    {
        foreach($this->roles as $role){

            if($role->id <= 2){

                return true;
            }
        }

        return false;
    }

    public function roles()
    {
        return $this->belongsToMany('App\Models\UserRoleType', 'users_roles', 'user_id', 'user_role_id');
    }

    public function isDeleted()
    {
        return !empty($this->deleted_at);
    }

    final public function transactions(): HasMany
    {
        return $this->hasMany(Transaction::class, 'user_id', 'id');
    }
}
