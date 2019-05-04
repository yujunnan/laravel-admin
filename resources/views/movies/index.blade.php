@extends('layouts.app')
@section('headerCss')
@parent
@endsection   
@section('content')
            <router-view></router-view>


@endsection
@section('footerScripts')
@parent
@endsection