<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Overtrue\Pinyin\Pinyin;
use Illuminate\Support\Str;
class Product extends Model
{
  	protected $fillable=['pinyin'];	
  	public static function boot(){
  		parent::boot();
  		static::saving(function($model){


  			$pinyin = new Pinyin(); 
  			$model->pinyin=$pinyin->sentence($model->name);
  			$model->number=date('Ymd',time()).$pinyin->abbr($model->name);
			

  		});
  	}
	public function user_role_product_prices(){

		return $this->hasMany(UserRoleProductPrice::class);
	}

}
