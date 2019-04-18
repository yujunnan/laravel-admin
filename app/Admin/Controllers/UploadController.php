<?php

namespace App\Admin\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;


class UploadController extends Controller
{
    public function postUploadPicture(Request $request)
    {

   
        if ($request->hasFile('picture')) {
            $picture = $request->file('picture');
            if (!$picture->isValid()) {
                //abort(400, '无效的上传文件');
                return response()->json(['errno'=>1,'msg'=>'无效的上传文件']);                   

            }
            // 文件扩展名
            $extension = $picture->getClientOriginalExtension();
            // 文件名
            $fileName = $picture->getClientOriginalName();
            // 生成新的统一格式的文件名
            $dirPath= date('Y-m-d',time());
            $newFileName =$dirPath.'/'.md5($fileName . time() . mt_rand(1, 10000)) . '.' . $extension;
            //文件保存路径
            $savePath = 'images/'. $newFileName;
            // Web 访问路径
            $webPath = '/storage/' . $savePath;

            // 将文件保存到本地 storage/app/public/images 目录下，先判断同名文件是否已经存在，如果存在直接返回
            if (Storage::disk('public')->has($savePath)) {
                return response()->json(['errno'=>0,'data' =>array($webPath)]);
            }
            //否则执行保存操作，保存成功将访问路径返回给调用方
            if ($picture->storePubliclyAs('images', $newFileName, ['disk' => 'public'])) {
                return response()->json(['errno'=>0,'data' =>array($webPath)]);
            }
            return response()->json(['errno'=>1,'msg'=>'上传文件失败']);
            } else {
            //abort(400, '请选择要上传的文件');
            return response()->json(['errno'=>1,'msg'=>'请选择要上传的文件']);                


        }

        
 




    }



    

   
}
