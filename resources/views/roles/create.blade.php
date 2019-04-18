@extends('layouts.app')
@section('title', '| 发布文章')
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
@section('content')
    @parent

<div class='col-lg-4 col-lg-offset-4'>

    <h1><i class='fa fa-key'></i> Add Role</h1>
    <hr>

    {{ Form::open(array('url' => 'roles')) }}

    <div class="form-group">
        {{ Form::label('name', 'Name') }}
        {{ Form::text('name', null, array('class' => 'form-control')) }}
    </div>

    <h5><b>Assign Permissions</b></h5>

    <div class='form-group'>
        @foreach ($permissions as $permission)
            {{ Form::checkbox('permissions[]',  $permission->id ) }}
            {{ Form::label($permission->name, ucfirst($permission->name)) }}<br>

        @endforeach
    </div>

    {{ Form::submit('Add', array('class' => 'btn btn-primary')) }}

    {{ Form::close() }}

</div>
@endsection
@section('footerScripts')
@parent 
@show