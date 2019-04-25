<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\SubmitFormRequest;
class RequestController extends Controller
{
    //用于显示上传表单
    public function formPage(){



    	return view('request.form');
    }
    //用于处理文件上传
    public function fileUpload(Request $request){
		Validator::make($request->all(), [
		    'picture' => 'bail|required|image|mimes:jpg,png,jpeg|max:1024'
		],[
		    'picture.required' => '请选择要上传的图片',
		    'picture.image' => '只支持上传图片',
		    'picture.mimes' => '只支持上传jpg/png/jpeg格式图片',
		    'picture.max' => '上传图片超过最大尺寸限制(1M)'
		])->validate();



		 if ($request->hasFile('picture')) {
		        $picture = $request->file('picture');
		        if (!$picture->isValid()) {
		            abort(400, '无效的上传文件');
		        }
		        // 文件扩展名
		        $extension = $picture->getClientOriginalExtension();
		        // 文件名
		        $fileName = $picture->getClientOriginalName();
		        // 生成新的统一格式的文件名
		        $newFileName = md5($fileName . time() . mt_rand(1, 10000)) . '.' . $extension;
		        // 图片保存路径
		        $savePath = 'images/' . $newFileName;
		        // Web 访问路径
		        $webPath = '/storage/' . $savePath;
		        // 将文件保存到本地 storage/app/public/images 目录下，先判断同名文件是否已经存在，如果存在直接返回
		        if (Storage::disk('public')->has($savePath)) {
		            return response()->json(['path' => $webPath]);
		        }
		        // 否则执行保存操作，保存成功将访问路径返回给调用方
		        if ($picture->storePubliclyAs('images', $newFileName, ['disk' => 'public'])) {
		            return response()->json(['path' => $webPath]);
		        }
		        abort(500, '文件上传失败');
		    } else {
		        abort(400, '请选择要上传的文件');
		    }
    }

    //通过 validate 方法进行验证
	/*
	public function form(Request $request)
	{

		Validator::make($request->all(), [
		   'title' => 'bail|required|string|between:2,32',
		   'url' => 'sometimes|url|max:200',
		   'picture' => 'nullable|string'
		], [
		   'title.required' => '标题字段不能为空',
		   'title.string' => '标题字段仅支持字符串',
		   'title.between' => '标题长度必须介于2-32之间',
		   'url.url' => 'URL格式不正确，请输入有效的URL',
		   'url.max' => 'URL长度不能超过200',
		])->validate();

	    return response('表单验证通过');
	}

	
	//通过匿名函数实现自定义规则
	public function form(Request $request)
	{
		$this->validate($request, [
		   'title' => [
		       'bail',
		       'required',
		       'string',
		       'between:2,32',
		       function($attribute, $value, $fail) {
		           if (strpos($value, '敏感词') !== false) {
		               return $fail('标题包含了系统禁用的敏感词');
		           }
		       },
		   ],
		   'url' => 'sometimes|url|max:200',
		   'picture' => 'nullable|string'
		], [
		   'title.required' => '标题字段不能为空',
		   'title.string' => '标题字段仅支持字符串',
		   'title.between' => '标题长度必须介于2-32之间',
		   'url.url' => 'URL格式不正确，请输入有效的URL',
		   'url.max' => 'URL长度不能超过200',
		]);		
	}
	*/
	//定义表单请求类执行请求验证
	public function form(SubmitFormRequest $request)
	{
	    return response('表单验证通过');
	}


}
