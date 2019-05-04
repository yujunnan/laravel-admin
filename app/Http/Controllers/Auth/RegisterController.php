<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Redis;
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $data['code_confirmation']=Redis::get('code');  
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'phone' => ['required', 'regex:/^1[34578][0-9]{9}$/', 'unique:users'],
            'code'=> ['required', 'confirmed'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ], [
            'name.required'=>'姓名必填',
            'name.string'=>'姓名必选是字符串',
            'name.max'=>'姓名最大255个字符',
            'email.required'=> '邮箱必填',
            'email.email'=>'邮箱格式错误',
            'email.max'=>'邮箱最大255个字符',
            'email.unique'=>'邮箱已绑定',
            'phone.required'=> '手机号必填',
            'phone.regex'=>'手机号格式错误',
            'phone.unique'=>'手机号已存在',
            'code.required'=>'请输入手机号',
            'code.confirmed'=>'两次输入验证码不一致',
            'password.required'=>'密码必填',
            'password.string'=>'密码必须是字符串',
            'password.min'=>'密码长度须大于8',
            'password.confirmed'=>'两次密码不一致',            
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'phone'=> $data['phone'],
            'email' => $data['email'],
            'password' => $data['password'],
        ]);
    }
}
