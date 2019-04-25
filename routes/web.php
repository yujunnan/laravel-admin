<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//Auth
Auth::routes();
//验证

Auth::routes(['verify' => true]);




Route::get('/home', 'HomeController@index')->name('home');

//编写第三方应用路由和控制器

Route::get('/auth', 'Auth\LoginController@oauth');
Route::get('/auth/callback', 'Auth\LoginController@callback');


Route::get('/auth/client', 'Auth\LoginController@client');


Route::get('/auth/implicit', 'Auth\LoginController@implicit');
Route::get('/auth/implicit/callback', 'Auth\LoginController@implicitCallback');




Route::get('/home', 'HomeController@index')->name('home');

//Post
Route::get('/',function(){

	return view("welcome");
});
Route::resource('posts', 'PostController');

//Users
Route::resource('users', 'UserController');

//Laravel permissions
Route::resource('permissions', 'PermissionController');

//Roles
Route::resource('roles', 'RoleController');


//电影
Route::get('movies', 'MovieController@index');
//获取电影信息
Route::post('movies/getmovies', 'MovieController@getmovies');



Route::get('movies/getmovie', 'MovieController@getmovie');


