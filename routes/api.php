<?php

use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::get('/users', [UserController::class, 'index'])->name('users.index');
Route::get('/user/{user}/transactions', [UserController::class, 'usersList'])->name('users.usersList');

Route::controller(TransactionController::class)->group(function () {
    Route::get('/transactions', 'index')->name('transaction.index');
    Route::view('/transactions/create', 'transaction.create')->name('transactions.view.create');
    Route::post('/transactions', 'store')->name('transactions.store');
    Route::get('/transactions/{transaction}/edit', 'edit')->name('transactions.edit');
    Route::post('/transactions/{transaction}', 'update')->name('transactions.update');
    Route::delete('/transactions/{transaction}', 'destroy')->name('transactions.destroy');
});

