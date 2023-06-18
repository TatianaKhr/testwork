<?php

use App\Http\Controllers\TransactionController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\RideOrderController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\CrondController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\FinanceController;

use App\Http\Controllers\TestController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::controller(AuthController::class)->group(function () {
    Route::get('/auth/login', 'login')->name('auth.login');
    Route::get('/auth/logout', 'logout')->name('auth.logout')->middleware('app.auth');
    Route::post('/auth/authenticate', 'authenticate')->name('auth.authenticate');
});

Route::controller(DashboardController::class)->group(function () {
    Route::get('/', 'index')->name('dashboard.index');
    Route::get('/access-denied', 'accessDenied')->name('dashboard.access_denied');
});

Route::middleware('app.auth')->controller(UserController::class)->group(function () {
    Route::get('/users', 'indexView')->name('users.view.index');
    Route::view('/users/create', 'users.create')->name('users.view.create');
    Route::post('/users', 'store')->name('users.store');
    Route::get('/users/{user}/edit', 'edit')->name('users.edit');
    Route::post('/users/{user}', 'update')->name('users.update');
    Route::delete('/users/{user}', 'destroy')->name('users.destroy');
});

Route::controller(TransactionController::class)->group(function () {
   Route::view('/transactions', 'transaction.index')->name('transactions');
});

Route::get('/transactions/{vue_capture?}', function() {
    return view('transaction.index');
})->where('vue_capture', '[\/\w\.-]*');
