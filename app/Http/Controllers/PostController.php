<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Post;
use Auth;
use Session;

class PostController extends Controller {

    public function __construct() {
        $this->middleware(['auth', 'clearance'])->except('index', 'show');
    }

    /**
     * 显示文章列表
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $posts = Post::orderby('id', 'desc')->paginate(5); //show only 5 items at a time in descending order

        return view('posts.index', compact('posts'));
    }

    /**
     * 显示创建文章表单
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('posts.create');
    }

    /**
     * 存储新增文章
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {

        //验证 title 和 body 字段
        $this->validate($request, [
            'title'=>'required|max:100',
            'body' =>'required',
        ]);

        $title = $request['title'];
        $body = $request['body'];

        $post = Post::create($request->only('title', 'body'));

        // 基于保存结果显示成功消息
        return redirect()->route('posts.index')
            ->with('flash_message', 'Article,
             '. $post->title.' created');
    }

    /**
     * 显示指定资源
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $post = Post::findOrFail($id); //通过 id = $id 查找文章

        return view ('posts.show', compact('post'));
    }

    /**
     * 显示编辑文章表单
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $post = Post::findOrFail($id);

        return view('posts.edit', compact('post'));
    }

    /**
     * 更新文章
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $this->validate($request, [
            'title'=>'required|max:100',
            'body'=>'required',
        ]);

        $post = Post::findOrFail($id);
        $post->title = $request->input('title');
        $post->body = $request->input('body');
        $post->save();

        return redirect()->route('posts.show',
            $post->id)->with('flash_message',
            'Article, '. $post->title.' updated');

    }

    /**
     * 删除文章
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $post = Post::findOrFail($id);
        $post->delete();

        return redirect()->route('posts.index')
            ->with('flash_message',
                'Article successfully deleted');

    }
}