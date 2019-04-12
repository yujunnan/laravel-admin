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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//编写第三方应用路由和控制器

Route::get('/auth', 'Auth\LoginController@oauth');
Route::get('/auth/callback', 'Auth\LoginController@callback');


Route::get('/auth/client', 'Auth\LoginController@client');


Route::get('/auth/implicit', 'Auth\LoginController@implicit');
Route::get('/auth/implicit/callback', 'Auth\LoginController@implicitCallback');


//Auth
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//Post
Route::get('/', 'PostController@index')->name('home');
Route::resource('posts', 'PostController');

//Users
Route::resource('users', 'UserController');

//Laravel permissions
Route::resource('permissions', 'PermissionController');

//Roles
Route::resource('roles', 'RoleController');