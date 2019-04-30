<?php

namespace App\Providers;

use Illuminate\Support\Facades\Event;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
//模型
use App\Product;    //产品
use App\ProductCategory; //产品分类
//观察者
use App\Observers\ProductObserver; //产品
use App\Observers\ProductCategoryObserver; //产品分类
//订阅者

//监听者
class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();
        //观察者
        //Product::observe(ProductObserver::class);
        ProductCategory::observe(ProductCategoryObserver::class);
    }
}
