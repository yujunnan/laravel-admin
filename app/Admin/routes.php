<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {
    //上传图片
    $router->post('uploads/postUploadPicture', 
        'UploadController@postUploadPicture');
    $router->get('/', 'HomeController@index');
    //电影
    $router->resource('movies', MovieController::class);
    //用户
    $router->resource('users', UserController::class);
    //产品信息
    $router->resource('products', ProductController::class);    
    //产品分类
    $router->resource('product_categorys',ProductCategoryController::class);  


});


