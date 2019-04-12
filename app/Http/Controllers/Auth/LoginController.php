<?php

namespace App\Http\Controllers\Auth;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
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
        $this->middleware('guest')->except('logout');
    }
/*
// 重写 AuthenticatesUsers 中的 login 方法
public function login(Request $request)
{
    $request->validate([
        'email' => 'required|string',
        'password' => 'required|string',
    ]);

    $http = new Client();

    // 发送相关字段到后端应用获取授权令牌
    $response = $http->post('http://homestead.test/oauth/token', [
        'form_params' => [
            'grant_type' => 'password',
            'client_id' => config('services.blog.appid'),
            'client_secret' => config('services.blog.secret'),
            'username' => $request->input('email'),  // 这里传递的是邮箱
            'password' => $request->input('password'), // 传递密码信息
            'scope' => '*'
        ],
    ]);

    return response($response->getBody());
}
// 发送相关字段到后端应用刷新令牌
public function refresh_token(){
$http = new GuzzleHttp\Client;
$response = $http->post('http://homestead.test/oauth/token', [
    'form_params' => [
        'grant_type' => 'refresh_token',
        'refresh_token' => 'your-refresh-token',
        'client_id' => 'your-client-id',
        'client_secret' => 'your-client-secret',
        'scope' => '*',
    ],
]);

return response($response->getBody());    
}
//用于请求授权获取授权码
public function oauth()
{

    $query = http_build_query([
        'client_id' => config('services.blog.appid'),
        'redirect_uri' => config('services.blog.callback'),
        'response_type' => 'code',
        'scope' => 'all-user-info get-post-info',
    ]);
  
    return redirect('http://homestead.test/oauth/authorize?'.$query);
}
//通过授权码在回跳路由中发起后端请求获取令牌
public function callback(Request $request)
{

    $code = $request->get('code');
    if (!$code) {
        dd('授权失败');
    }
    $http = new Client();
    $response = $http->post('http://homestead.test/oauth/token', [
        'form_params' => [
            'grant_type' => 'authorization_code',
            'client_id' => config('services.blog.appid'),  // your client id
            'client_secret' => config('services.blog.secret'),   // your client secret
            'redirect_uri' => config('services.blog.callback'),
            'code' => $code,
        ],
    ]);

    return response($response->getBody());
}

//通过客户端凭证颁发访问令牌
public function client()
{
    $http = new Client();
    $response = $http->post('http://homestead.test/oauth/token', [
        'form_params' => [
            'grant_type' => 'client_credentials',
            'client_id' => config('services.blog.appid'),  // your client id
            'client_secret' => config('services.blog.secret'),   // your client secret
            'scope' => '*'
        ],
    ]);

    return response($response->getBody());
}
//路由中发送认证请求到后端系统的 oauth/authorize 路由
public function implicit()
{
    $query = http_build_query([
        'client_id' =>4,
        'redirect_uri' => config('services.blog.enablecallback'),
        'response_type' => 'token',
        'scope' => '',
    ]);

    return redirect('http://homestead.test/oauth/authorize?'.$query);
}
//如果认证成功会将令牌信息通过传入的 redirect_uri 链接回跳的时候返回
public function implicitCallback(Request $request)
{
    dd($request->get('access_token'));
}
*/



}
