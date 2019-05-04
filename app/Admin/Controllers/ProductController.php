<?php

namespace App\Admin\Controllers;
use App\ProductCategory;
use App\Product;
use App\Role;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
class ProductController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {


        return $content
            ->header('列表')
            ->description('产品信息')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content

            ->header('详情')
            ->description('产品信息')

            ->body($this->detail($id));
    }
    /**
     * 修改数据 interface.
     *
     * @param mixed $id
     * 
     * 
     */
    public function update(Request $request){
        if($request->isMethod('post')){
           
            $validator=Validator::make($request->all(), [
                'name' => 'required',
                'price'=> 'required',
                'sort'=>'required',

                'content'=>'required',
                'prices.*.product_price'=>'required'
            ],[
                'name.required' => '产品名称必填',
                'price.required' => '请输入价格',
                'sort.required'=>'排序必填',
                'content.required'=>'请输入产品描述',
                'prices.*.product_price.required'=>'价格必填'

            ])->validate();
            $product=Product::with('user_role_product_prices.role')->findOrFail($request['id']);
            if($request->hasFile('thumbnail')){
                $thumbnail = $request->file('thumbnail');
                // 文件扩展名
                $extension = $thumbnail->getClientOriginalExtension();
                // 文件名
                $fileName = $thumbnail->getClientOriginalName();
                // 生成新的统一格式的文件名
                $newFileName = md5($fileName . time() . mt_rand(1, 10000)) . '.' . $extension;
                // 图片保存路径
                $webPath = '/images/' . $newFileName;
                // Web 访问路径
                $thumbnail->storePubliclyAs('images', $newFileName, ['disk' => 'admin']);
                $product->thumbnail = $webPath;
            }
           
            
            $product->name = $request['name'];
            $product->price = $request['price'];
           
            $product->content = $request['content'];
            $product->sort = $request['sort'];
            $product->product_category_id = $request['product_category_id'];
            $product->status = $request['status'];
            $product->save();
            $product->user_role_product_prices()->delete();
            $product->user_role_product_prices()->createMany($request['prices']);
            return redirect('admin/products');




        }    

    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content,Request $request)
    {


        $form = new Form(new Product);
        $product=Product::with('user_role_product_prices.role')->findOrFail($id);
        $html=(object)[];
        $html->name=$form->text('name', '产品名')->default($product->name);
        $html->price=$form->currency('price','参考价')->default($product->price);
        $html->thumbnail=$form->image('thumbnail','缩略图')->value($product->thumbnail);
        $html->content=$form->editor('content','产品描述')->default($product->content);
        $html->sort=$form->number('sort','排序')->default($product->sort);
        $html->status=$form->radio('status','状态')->options([ 1=> '已上架',0 => '已下架',2=>'已售空'])->default($product->status);
        $html->product_category_id=$form->select('product_category_id','类别')->options(ProductCategory::product_categorys_options())->default($product->product_category_id);
        
        return $content
            ->header('创建')
            ->description('产品')
            ->body(view('admin.products.edit', 
            [
                'html'=>$html,
                'roles'=>$product->user_role_product_prices,
                'id'=>$id                 
                
            ])->render());



    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content,Request $request)
    {


        if($request->isMethod('post')){


            
       
            $validator=Validator::make($request->all(), [
                'name' => 'required',
                'price'=> 'required',
                'sort'=>'required',
                'thumbnail'=>'required',
                'content'=>'required',
                'prices.*.product_price'=>'required|size:2,5'
            ],[
                'name.required' => '产品名称必填',
                'price.required' => '请输入价格',
                'sort.required'=>'排序必填',
                'thumbnail.required'=>'请上传图片',
                'content.required'=>'请输入产品描述',
                'prices.*.product_price.required'=>'价格必填',
                'prices.*.product_price.size'=>'金额必选大于等于10元或小于等于99999元'

            ])->validate();

            $thumbnail = $request->file('thumbnail');
            // 文件扩展名
            $extension = $thumbnail->getClientOriginalExtension();
            // 文件名
            $fileName = $thumbnail->getClientOriginalName();
            // 生成新的统一格式的文件名
            $newFileName = md5($fileName . time() . mt_rand(1, 10000)) . '.' . $extension;
            // 图片保存路径
            $webPath = '/images/' . $newFileName;
            // Web 访问路径
            $thumbnail->storePubliclyAs('images', $newFileName, ['disk' => 'admin']);



            $product = new Product();
            $product->name = $request['name'];
            $product->price = $request['price'];
            $product->thumbnail = $webPath;
            $product->content = $request['content'];
            $product->sort = $request['sort'];
            $product->product_category_id = $request['product_category_id'];
            $product->status = $request['status'];
            $product->save();
            $product->user_role_product_prices()->createMany($request['prices']);

            return redirect('admin/products');

        }


        return $content
            ->header('创建')
            ->description('产品')
            ->body(view('admin.products.create', 
            [
                'html'=>$this->form(),
                'roles'=>Role::role_options()                
                
            ])->render());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
       
        $grid = new Grid(new Product);

        $grid->id('Id');

        $grid->name('名称');
        $grid->price('价格');
        $grid->thumbnail('缩略图')->display(function($thumbnail){
            return "<img src=".config('filesystems.disks.admin.url').$thumbnail." height='50px'>";

        });
        $grid->number('产品编号');
        $grid->status('状态')->options([0 => '禁用', 1=> '启用'])->default(1);
        $grid->created_at('创建时间');
        $grid->updated_at('修改时间');
        $grid->actions(function (Grid\Displayers\Actions $actions) {
        
        $actions->disableDelete();
        
        });

        $grid->tools(function ($tools) {
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $form = new Form(new Product);
        $product=Product::with('user_role_product_prices.role')->findOrFail($id);

        $html=(object)[];
        $html->name=$form->text('name', '产品名')->default($product->name)->readonly();
        $html->price=$form->text('price','参考价')->default($product->price)->readonly();
        $html->thumbnail=$form->image('thumbnail','缩略图')->value($product->thumbnail)->attribute('disabled');
        $html->content=$form->editor('content','产品描述')->default($product->content)->attribute('disabled');
        $html->sort=$form->text('sort','排序')->default($product->sort)->readonly();
        $html->status=$form->radio('status','状态')->options([ 1=> '已上架',0 => '已下架',2=>'已售空'])->default($product->status)->attribute('disabled');
        $html->product_category_id=$form->select('product_category_id','类别')->options(ProductCategory::product_categorys_options())->attribute('disabled')->default($product->product_category_id);
        return view('admin.products.show', 
        [
                'html'=>$html,
                'roles'=>$product->user_role_product_prices             
 
        ]);

    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {

        //获取产品类别
        $form = new Form(new Product);
        $html=(object)[];
        $html->name=$form->text('name', '产品名');
        $html->price=$form->currency('price','参考价')->default(50)->symbol('￥');
        $html->thumbnail=$form->image('thumbnail','缩略图');
        $html->content=$form->editor('content','产品描述');
        $html->sort=$form->number('sort','排序')->max(1000)->min(0)->default(0);
        $html->status=$form->radio('status','状态')->options([ 1=> '已上架',0 => '已下架',2=>'已售空'])->default(1);
        $html->product_category_id=$form->select('product_category_id','类别')->options(ProductCategory::product_categorys_options())->default(1);


        
        return $html;
    }
}
