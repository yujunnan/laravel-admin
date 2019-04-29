<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Overtrue\Pinyin\Pinyin;
class ProductCategory extends Model
{
  	protected $fillable=['ping'];
  	public static function boot(){
  		parent::boot();
  		static::saving(function($model){
  			$pinyin = new Pinyin(); 
  			$model->pinyin=$pinyin->sentence($model->name);
  			
  		});
  	}
}
