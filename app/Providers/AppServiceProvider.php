<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use App\Models\UserAccessToken;
use Laravel\Sanctum\Sanctum;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Sanctum::usePersonalAccessTokenModel(UserAccessToken::class);

        Paginator::useBootstrap();
    }
}
