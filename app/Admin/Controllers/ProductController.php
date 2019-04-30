<?php

namespace App\Admin\Controllers;
use App\ProductCategory;
use App\Product;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
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
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content

            ->header('修改')
            ->description('产品信息')

            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content,Request $request)
    {
        //获取产品类别
        $form = new Form(new Product);
        return $content
            ->header('创建')
            ->description('产品')
            ->body(view('admin.products.create', 
            [
                'name' => $form->text('name', '电影名'),
                'price' =>$form->number('price','价格(元)')->max(10000)->min(50)->default(50),
                'thumbnail' =>$form->image('thumbnail','缩略图'),
                'content'=> $form->editor('content','内容'),
                'sort'=> $form->number('sort','排序')->max(1000)->min(0)->default(0),
                'status'=> $form->checkbox('status','状态')->options([0 => '禁用', 1=> '启用'])->default(1),
                'product_category_id'=>$form->select('product_category_id','类别')->options(ProductCategory::product_categorys_options())
                
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
        $grid->thumbnail('缩略图');
        $grid->number('产品编号');
        $grid->status('状态')->options([0 => '禁用', 1=> '启用'])->default(1);
        $grid->created_at('创建时间');
        $grid->updated_at('修改时间');

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

        $show = new Show(Product::findOrFail($id));

        $show->id('Id');
        $show->name('电影名');
        $show->created_at('创建时间');
        $show->updated_at('修改时间');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {



        
        return $form;
    }
}
