@extends('layouts.app')
@section('title', '| 查看文章')
@section('headerCss')
@parent 
@endsection
<!--头部--> 
@section('header')
@parent 
@endsection
<!--侧边栏-->
@section('sidebar')
@endsection
<!--设置导航--> 
@section('navigation')        
@parent 
@endsection
<!--网站内容--> 
@section('content')
    @parent
    <div class="row">
        <div class="col-md-8 col-md-offset-2">

        <h1>Create New Post</h1>
        <hr>

        {{-- 使用 Laravel HTML Form Collective 创建表单 --}}
        {{ Form::open(array('route' => 'posts.store')) }}

        <div class="form-group">
            {{ Form::label('title', 'Title') }}
            {{ Form::text('title', null, array('class' => 'form-control')) }}
            <br>
                <imagesupload-component></imagesupload-component>
            {{ Form::label('body', 'Post Body') }}
            {{ Form::textarea('body', null, array('class' => 'form-control')) }}
            <br>

            {{ Form::submit('Create Post', array('class' => 'btn btn-success btn-lg btn-block')) }}
            {{ Form::close() }}
        </div>
        </div>
    </div>

@endsection
@section('footerScripts')
@parent 
@endsection