@extends('layouts.app')
@section('headerCss')
@parent
@show   
@section('content')
            <router-view></router-view>


@endsection
@section('footerScripts')
@parent
@endsection