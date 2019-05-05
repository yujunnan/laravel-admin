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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">


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
            <nav class="navbar navbar-expand-lg navbar-light bg-light" >
              <a class="navbar-brand" href="{{ url('/') }}"> {{ config('app.name', '我的部落') }}</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="{{ url('/') }}">首页 <span class="sr-only">(current)</span></a>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      新闻
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="{{ url('posts') }}">新闻</a>
                        @if (!Auth::guest())
                            <a class="dropdown-item" href="{{ route('posts.create') }}">发布新闻</a>
                        @endif
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="{{ url('movies') }}#movies">电影</a>
                  </li>
                </ul>

                <ul class="navbar-nav navbar-right">
                    @if (Auth::guest())
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">登录</a>
                       
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('register') }}">注册</a>
                       
                    </li>
                    @else
                    <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      {{ Auth::user()->name }}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                        @role('Admin') {{-- Laravel-permission blade 辅助函数 --}}
                            <a class="dropdown-item" href="{{ url('posts') }}"><i class="fa fa-btn fa-unlock"></i>Admin</a>
                        @endrole
                        <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                            退出
                        </a>

                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                             {{ csrf_field() }}
                        </form>

                    </div>
                    </li>   
                    @endif                 
                </ul>
                <!--
                <form class="form-inline my-2 my-lg-0">
                  <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--引入javascript--> 
@section('footerScripts')
<!-- Scripts -->
<script>
    window.Laravel = {!! json_encode([
        'csrfToken' => csrf_token(),
    ]) !!};
</script>

@show 
