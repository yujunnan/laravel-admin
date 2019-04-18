@extends('layouts.app')
@section('title', '| 创建权限')
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

    <h1><i class='fa fa-key'></i> Add Permission</h1>
    <br>

    {{ Form::open(array('url' => 'permissions')) }}

    <div class="form-group">
        {{ Form::label('name', 'Name') }}
        {{ Form::text('name', '', array('class' => 'form-control')) }}
    </div><br>
    @if(!$roles->isEmpty()) //If no roles exist yet
        <h4>Assign Permission to Roles</h4>

        @foreach ($roles as $role) 
            {{ Form::checkbox('roles[]',  $role->id ) }}
            {{ Form::label($role->name, ucfirst($role->name)) }}<br>

        @endforeach
    @endif
    <br>
    {{ Form::submit('Add', array('class' => 'btn btn-primary')) }}

    {{ Form::close() }}

</div>

@endsection
@section('footerScripts')
@parent 
@show