<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserRoleType extends Model {

    use SoftDeletes;
    
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users_roles_types';
    
	protected $fillable = [
        'title'
    ];
    
    public function accessPermissionsGroups()
    {
        return $this->belongsToMany('App\Models\AccessPermissionGroup','users_roles_types_access_permissions_groups');
    }
}
