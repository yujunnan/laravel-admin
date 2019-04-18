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
    <div class="row">

        <div class="col-md-8 col-md-offset-2">

            <h1>Edit Post</h1>
            <hr>
                {{ Form::model($post, array('route' => array('posts.update', $post->id), 'method' => 'PUT')) }}
                <div class="form-group">
                {{ Form::label('title', 'Title') }}
                {{ Form::text('title', null, array('class' => 'form-control')) }}<br>

                {{ Form::label('body', 'Post Body') }}
                {{ Form::textarea('body', null, array('class' => 'form-control')) }}<br>

                {{ Form::submit('Save', array('class' => 'btn btn-primary')) }}

                {{ Form::close() }}
        </div>
        </div>
    </div>

@endsection
@section('footerScripts')
@parent 
@show