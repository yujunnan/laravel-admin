<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Movie;
class MovieController extends Controller
{
    public function index(){


    	 return view('movies.index');
    }

    //获取电影信息
    public function getmovies(Request $request){
		$page=$request->input('page');
		$limit=$request->input('limit');
		$offset=$page*$limit;
		$list=Movie::offset($offset)->limit($limit)->get();
    	return response()->json(['movies'=>$list]);
    }
    //获取电影详细信息
    public function getmovie(Request $request){
    
    	return view('movies.movie');
    }
}
