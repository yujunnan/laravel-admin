<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Overtrue\Pinyin\Pinyin;
class ProductCategory extends Model
{
  	protected $fillable=['pinyin'];
  	/*
  	public static function boot(){
  		parent::boot();
  		static::saving(function($model){
  			$pinyin = new Pinyin(); 
  			$model->pinyin=$pinyin->sentence($model->name);
  			
  		});
  	}
  	*/
    
  
    static function product_categorys_options(){
      $product_categorys=self::where('status',1)->get(['id', 'name']);
      $options=array();
      foreach ($product_categorys as $item) {
          $options[$item->id]=$item->name;
      }   
      return $options; 
    }
}
