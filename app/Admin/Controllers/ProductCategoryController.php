<?php

namespace App\Admin\Controllers;

use App\ProductCategory;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
class ProductCategoryController extends Controller
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
            ->header('产品分类信息')
            ->description('在这里管理你的产品')
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
            ->header('查看')
            ->description('产品分类')
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
            ->description('产品分类')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {

        return $content
            ->header('创建')
            ->description('产品分类')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProductCategory);

        $grid->id('Id');
        $grid->name('类别名称');
        $grid->status('状态')->display(function($status){
            if($status==0){
                return $status="<span style='color:red'>禁用</span>";
            }
            if($status==1){
                return $status="<span style='color:green'>启用</span>";
            }

        });
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

        $show = new Show(ProductCategory::findOrFail($id));
        $show->name('类别名称');
        $show->status('状态')->as(function($status){
            if($status==0){
                return $status="禁用";
            }
            if($status==1){
                return $status="启用";
            }

        });
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

        

        $form = new Form(new ProductCategory);
       

        $form->text('name', '类别名称')->rules('required', [
            'required' => '类型名称'
        ]);
        $form->radio('status', '状态')->options([0 => '禁用', 1=> '启用'])->default(1);  
        $form->number('sort', '排序')->default(0)->max(1000)->min(0);

        
        return $form;
    }
}
