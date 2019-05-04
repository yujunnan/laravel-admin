<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>


    @section('headerCss')
    <!-- Styles -->

    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    @show    
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

    

</head>
<body>
    <div id="app">
        

        <!--头部--> 
        @section('header')
        @show

        <!--侧边栏-->
        @section('sidebar')
        @show 

        <!--设置导航--> 
        @section('navigation')        
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!-- Branding Image -->
                    <a class="navbar-brand" href="{{ url('/') }}">
                        {{ config('app.name', '我的部落') }}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <!-- 导航条左边 -->
                    <ul class="nav navbar-nav">
                        <li><a href="{{ url('/') }}">首页</a></li>
                        <!--<li><a href="{{ url('posts') }}">文章</a></li>-->
                        <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                   新闻<span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ url('posts') }}">
                                            新闻
                                        </a>
                                    @if (!Auth::guest())
                                    <li><a href="{{ route('posts.create') }}">发布新闻</a></li>
                                    @endif
                                    </li>
                                </ul>
                        </li>                       
                        <li><a href="{{ url('movies') }}#movies">电影</a></li>

                    </ul>

                    <!-- 导航条右边 -->
                    <ul class="nav navbar-nav navbar-right">
                        <!-- 登录注册链接 -->
                        @if (Auth::guest())
                            <li><a href="{{ route('login') }}">登录</a></li>
                            <li><a href="{{ route('register') }}">注册</a></li>
                        @else
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        @role('Admin') {{-- Laravel-permission blade 辅助函数 --}}
                                        <a href="#"><i class="fa fa-btn fa-unlock"></i>Admin</a>
                                        @endrole
                                        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                            退出
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </nav>
        @show
        <!--主体-->
        @section('content')
            @if(Session::has('flash_message'))
                <div class="container">      
                    <div class="alert alert-success"><em> {!! session('flash_message') !!}</em>
                    </div>
                </div>
            @endif 
            <div class="row">
                <div class="col-md-8 col-md-offset-2">              
                    @include ('errors.list') {{-- 引入错误文件 --}}
                </div>
            </div>
        @show
        <!--底部信息-->
        @section('footer')

        @show
        <!--弹框--> 
        @section('alert')

        @show




        
    </div>


</body>
</html>
<script src="https://use.fontawesome.com/9712be8772.js"></script>
<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--引入javascript--> 
@section('footerScripts')
<!-- Scripts -->
<script>
    window.Laravel = {!! json_encode([
        'csrfToken' => csrf_token(),
    ]) !!};
</script>

@show 
