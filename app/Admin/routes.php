<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    //电影
    $router->resource('movies', MovieController::class);
    //用户
    $router->resource('movies', MovieController::class);    
    $router->resource('products', ProductController::class);
    //上传图片
    $router->post('uploads/postUploadPicture', 
    	'UploadController@postUploadPicture');

});


