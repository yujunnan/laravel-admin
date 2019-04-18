@extends('layouts.app')
@section('title', '| 查看文章')
@section('headerCss')
@parent 
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
<!--网站内容--> 
@section('content')
    @parent
    <div class="container">
        <h1>{{ $post->title }}</h1>
        <hr>
        <p class="lead">{{ $post->body }} </p>
        <hr>
        {!! Form::open(['method' => 'DELETE', 'route' => ['posts.destroy', $post->id] ]) !!}
        <a href="{{ url()->previous() }}" class="btn btn-primary">Back</a>
        @can('Edit Post')
        <a href="{{ route('posts.edit', $post->id) }}" class="btn btn-info" role="button">Edit</a>
        @endcan
        @can('Delete Post')
        {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
        @endcan
        {!! Form::close() !!}

    </div>
@endsection
@section('footerScripts')
@parent 
@show