<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
  	protected $fillable = ['title', 'body'];

 	protected $dates = ['published_at'];
    public function setTitleAttribute($value)
    {
        $this->attributes['title'] = $value;

        if (! $this->exists) {
            $this->attributes['slug'] = str_slug($value);
        }
    }

    
}
