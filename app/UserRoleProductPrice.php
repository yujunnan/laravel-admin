<?php

namespace App;

use App\Role;
use Illuminate\Database\Eloquent\Model;
class UserRoleProductPrice extends Model
{
	protected $fillable = ['product_price', 'product_id', 'role_id'];
	public function role(){

		return $this->belongsTo(Role::class);
	}	

}
