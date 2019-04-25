<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
  	protected $fillable = ['title', 'body','url'];

 	protected $dates = ['published_at'];
    public function setTitleAttribute($value)
    {
        $this->attributes['title'] = $value;

        if (! $this->exists) {
            $this->attributes['slug'] = str_slug($value);
        }
    }
    //建立与images一对一多态关联
    public function image(){
    	 return $this->morphOne(Image::class, 'imageable');
    }
}
