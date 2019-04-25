@extends('layouts.app')
@section('title', '| 首页')
@section('headerCss')
@parent 
<style type="text/css">



</style> 
@show
<!--头部--> 
@section('header')
@parent
@show
<!--侧边栏-->
@section('sidebar')
@show
<!--设置导航--> 
@section('navigation')        
@parent 
@show 
@section('content')
    @parent
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3>Posts</h3></div>
                    <div class="panel-heading">Page {{ $posts->currentPage() }} of {{ $posts->lastPage() }}
                    </div>
                    @foreach ($posts as $post)
                    <!---->
                    <div class="panel-body">
                        <div class="col-md-2">
                            @if(isset($post->image->url))
                                <img src="{{$post->image->url}}" width="100%" >
                            @endif
                            @if(!$post->image)
                                <img src="/storage/images/75df72ed1747208c8130af6c12d8ea84.jpg" width="100%" >
                            @endif
                        </div>
                        <div class="col-md-10">
                            <a href="{{ route('posts.show', $post->id ) }}">
                            {{$post->title}}
                            </a>
                            <p>
                            {{str_limit($post->body,300,'...')}}
                            </p>                
                        </div>
                    </div>
                    @endforeach
                </div>
                <div class="text-center">
                    {!! $posts->links() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
@section('footerScripts')
@parent 
@show