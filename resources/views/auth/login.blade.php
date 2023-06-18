@extends('layouts.blank')

@section('content')

<div class="auth-layout-wrap">
    <div class="auth-content" style="min-width:345px">
        <div class="card o-hidden">
            <div class="row">
                <div class="col-md-12">
                    <div class="p-4">
                        <div class="auth-logo text-center mb-4">
                            <img src="{{ asset('/assets/images/logo-tacka.png') }}" alt="">
                        </div>
                        <div style="text-align:center"><h1 class="mb-3 text-18">{{ env('APP_NAME') }}</h1></div>
                                            
                        <form method="post" action="{{ route('auth.authenticate') }}" class="login-form">

                            <div class="form-group">
                                <label>{{ trans('login.login') }}</label>
                                <input name="login" class="form-control form-control error" type="text" data-rule="required" value="" required="">
                            </div>
                            <div class="form-group">
                                <label>{{ trans('login.password') }}</label>
                                <input name="password" class="form-control form-control" type="password" data-rule="required" required="">
                            </div>

                            <button type="submit" class="btn  btn-primary btn-block mt-2">{{ trans('login.submit') }}</button>

                            <input type="hidden" name="_token" value="{{{ csrf_token() }}}" />

                            <input type="hidden" name="remember" value="1" />

                        </form>

                        <?php
                        /*
                        <div class="mt-3 text-center">
                            <a href="user/registration" class="text-muted"><u>{{ trans('login.registration') }}</u></a>
                        </div>
                        <div class="mt-3 text-center">
                            <a href="user/forgot_password" class="text-muted"><u>{{ trans('login.forgot_password') }}</u></a>
                        </div>
                        */
                        ?>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

@endsection