<?php

namespace App\Observers;

use App\ProductCategory;
use Overtrue\Pinyin\Pinyin;
class ProductCategoryObserver
{
    /**
     * Handle the product category "created" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function created(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Handle the product category "updated" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function updated(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Handle the product category "deleted" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function deleted(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Handle the product category "restored" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function restored(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Handle the product category "force deleted" event.
     *
     * @param  \App\ProductCategory  $productCategory
     * @return void
     */
    public function forceDeleted(ProductCategory $productCategory)
    {
        //
    }

    public function saving(ProductCategory $productCategory){
            $pinyin = new Pinyin(); 
            $productCategory->pinyin=$pinyin->sentence($productCategory->name);
            
    }
}
