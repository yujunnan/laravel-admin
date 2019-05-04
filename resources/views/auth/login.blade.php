@extends('layouts.app')
@section('headerCss')
@parent
@endsection
@section('content')
<!-- 选项卡菜单-->


<div class="container">

<ul id="myTab" class="nav nav-pills" role="tablist">
    <li class="active"><a href="#bulletin" role="tab">公告</a></li>
    <li><a href="#rule" role="tab" >规则</a></li>

</ul>
<!-- 选项卡面板 -->
<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="bulletin">公告内容面板</div>
    <div class="tab-pane fade" id="rule">规则内容面板</div>

</div>


        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('登录') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('邮箱/手机号') }}</label>

                            <div class="col-md-6">
                                <input id="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>

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
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('记住密码') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('登录') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('邮箱找回密码') }}
                                    </a>
                                @endif
                                @if (Route::has('phone.request'))
                                    <a class="btn btn-link" href="{{ route('phone.request') }}">
                                        {{ __('手机号找回密码') }}
                                    </a>
                                @endif


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
$(function(){
    $("#myTab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    });
    $("#myTab").on("show.bs.tab",function(e){
         $(e.target).css('outline','1px solid black');    
    }).on("hide.bs.tab",function(e){
        $(e.target).css('outline','none');  
    })
})

</script>
@endsection