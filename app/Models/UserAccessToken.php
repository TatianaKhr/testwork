<?php
namespace App\Models;

use Laravel\Sanctum\PersonalAccessToken as SanctumPersonalAccessToken;

class UserAccessToken extends SanctumPersonalAccessToken
{
    /**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users_access_tokens';
}
