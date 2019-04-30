<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
class Role extends Model
{
  	//获取角色
    static function role_options(){
      $product_categorys=self::->get();
      $options=array();  
      return $product_categorys; 
    }	


}
