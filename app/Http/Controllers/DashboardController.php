<?php namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller {

    public function index()
    {
        return redirect('/users');
    }

    public function accessDenied()
    {
        return view('dashboard/access_denied');
    }
}