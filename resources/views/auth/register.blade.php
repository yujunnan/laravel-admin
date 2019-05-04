@extends('layouts.app')
@section('headerCss')
@parent
<style>
#phone_error{
    display:none;
}
</style>
@endsection

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('注册') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('姓名') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('手机号') }}</label>

                            <div class="col-md-6">
                                <input id="phone" type="phone" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{ old('phone') }}" required>

                                    <span id="phone_error" class="invalid-feedback" role="alert">
                                        <!--<strong>{{ $errors->first('phone') }}</strong>-->
                                    </span>
                       
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('验证码') }}</label>

                            <div class="col-md-4">
                                <input id="code" type="code" class="form-control{{ $errors->has('code') ? ' is-invalid' : '' }}" name="code" value="{{ old('code') }}" required>
                                @if ($errors->has('code'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('code') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-md-2">
                              
                            <button type="button" class="btn btn-info up_code" >发送短信</button>
                            </div>



                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('邮箱') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('密码') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('确认密码') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('注册') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('footerScripts')
@parent
<script type="text/javascript">

    //添加滚动事件
  
$(function(){
    $(".up_code").click(function(event) {
        var phone =$("input[name='phone']").val();
        
        $.ajax({
            url: "sms/upcode",
            type: 'post',
            data: {
                '_token':"{{csrf_token()}}",
                'phone': phone
            },
            dataType: 'json',
            success: function(data) {
                if(data.success==false){
                    $("#phone_error").css("display","block");
                    $("#phone_error").html("<strong>"+data.errors.phone+"</strong>");
                }else{
                     $("#phone_error").css("display","none");
                    timer();

                }

            }
        })

    });

})
function timer(){
    var num = 60;
    $(".up_code").attr("disabled","true");
    var interval = window.setInterval(function() {
        $('.up_code').html(--num + 's 重新发送');
        if (num == 0) {
            $(".up_code").removeAttr("disabled");
            enable = true;
            window.clearInterval(interval);
            $('.up_code').html('重新发送');
        }
    },
    1000);

}
</script> 
@endsection
