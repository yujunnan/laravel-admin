<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Overtrue\EasySms\EasySms;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Validator;

class SmsController extends Controller {

   

    /**
     * 发送短信
     *
     * @return \Illuminate\Http\Response
     */
    public function upcode(Request $request) {
        $input = $request->all();
        $rules = [
           'phone' => 'required|regex:/^1[34578][0-9]{9}$/|unique:users'
        ];  
        $message = [
            'phone.required'=> '手机号必填',
            'phone.regex'=>'手机号格式错误',
            'phone.unique'=>'手机号已存在'
        ];
        //分离验证组件 中文处理 
        $validator = Validator::make($input,$rules,$message);
        if ($validator->fails()) {
            return response()->json(array(
                    'success' => false,
                    'message' => 'There are incorect values in the form!',
                    'errors' => $validator->getMessageBag()->toArray()
            ));
        }
        $phone=$request['phone'];
        $easySms = new EasySms(config('sms'));
        $code=mt_rand(999, 9999);
        Redis::set('code', $code);
        $getCode=Redis::get('code');      
        $info=$easySms->send($phone, [
            
            'template' => 'SMS_126464859',
            'data' => [
                'iphone' => $phone,
                'password'=>$getCode
            ],
        ]);
        return $info;
    }

 
}