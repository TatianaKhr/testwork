<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', '') }}</title>
    <link href="{{ asset('https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/themes/lite-green.min.css?v=2') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/perfect-scrollbar.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/ladda-themeless.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/fontawesome/css/fontawesome.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/fontawesome/css/light.css') }}" rel="stylesheet" />
    <script src="{{ asset('assets/js/plugins/jquery-3.3.1.min.js') }}"></script>
    <link href="{{ asset('assets/css/plugins/pickadate/classic.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/pickadate/classic.date.css') }}" rel="stylesheet" />
    <link href="{{ asset('https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css') }}" rel="stylesheet" />
    <link rel="stylesheet" href="https://unpkg.com/vue-datepicker/dist/vue-datepicker.min.css">
{{--    <script src="https://unpkg.com/vue@3.0.0/dist/vue.global.js"></script>--}}
    <link rel="icon" type="image/x-icon" href="{{ asset('favicon.ico') }}">


    <script>

    $(document).ready(function () {

        $('.btn-url').on('click',function(event){

            event.preventDefault();

            window.location = $(this).data('url');
        });

        submitButton = $('.submit-btn');

        submitButton.on('click',function(e){

            event.preventDefault();

            if($(this).hasClass('.in-process')){

                return;
            }

            $(this).addClass('in-process');

            var laddaBtn = e.currentTarget;
            var ladda = Ladda.create(laddaBtn);
            ladda.start();

            $(this).parents('form').submit();

        });

    });
    </script>
    <script type="module">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN':  $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
</head>

<body class="text-left">
    <div class="app-admin-wrap layout-sidebar-large">
        <div class="main-header">
            <div class="logo">
                <img src="{{ asset('/assets/images/logo-tacka.png') }}" alt="">
            </div>
            <div class="menu-toggle">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="d-flex align-items-center">

            </div>
            <div style="margin: auto"></div>
            <div class="header-part-right">
                <!-- Full screen toggle -->
                <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>

                <!-- User dropdown -->
                <div class="dropdown">
                    <div class="user col align-self-end">
                        <i class="i-Lock-User mr-1 header-icon" id="userDropdown" alt="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <div class="dropdown-header">
                                <i class="i-Lock-User mr-1 "></i>
                            </div>
                            <a class="dropdown-item" href="#">{{ trans('users.profile') }}</a>
                            <a class="dropdown-item" href="{{ route('auth.logout') }}">{{ trans('auth.logout') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="side-content-wrap">
            <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <ul class="navigation-left">

                    <li class="nav-item" data-item="users"><a class="nav-item-hold" href="{{ route('users.view.index') }}"><i class="nav-icon fa-light fa-users"></i><span class="nav-text">{{ trans('users.title') }}</span></a>
                    </li>

                    <li class="nav-item" data-item="transactions"><a class="nav-item-hold" href="{{ route('transactions') }}"><i class="nav-icon fa-light fa-money-check-dollar"></i><span class="nav-text">{{ trans('transactions.title') }}</span></a>
                    </li>

                </ul>
            </div>
            <div class="sidebar-left-secondary rtl-ps-none" data-perfect-scrollbar="" data-suppress-scroll-x="true">
                <!-- Submenu Dashboards-->

                <ul class="childNav" data-parent="users">
                    <li class="nav-item"><a href="{{ route('users.view.create') }}"><i class="nav-icon i-Add"></i><span class="item-name">{{ trans('users.create') }}</span></a></li>
                    <li class="nav-item"><a href="{{ route('users.view.index') }}"><i class="nav-icon i-Checked-User"></i><span class="item-name">{{ trans('users.list') }}</span></a></li>
                </ul>
                <ul class="childNav" data-parent="transactions">
                    <li class="nav-item"><a href="{{ route('transactions') }}"><i class="nav-icon i-Add"></i><span class="item-name">{{ trans('transactions.create') }}</span></a></li>
                    <li class="nav-item"><a href="{{ route('transactions') }}"><i class="nav-icon fa-light fa-money-bill-trend-up"></i><span class="item-name">{{ trans('transactions.list') }}</span></a></li>
                </ul>


            </div>
            <div class="sidebar-overlay"></div>
        </div>
        <!-- =============== Left side End ================-->
        <div class="main-content-wrap sidenav-open d-flex flex-column">
            <!-- ============ Body content start ============= -->
            <div class="main-content">
                <div class="row">
                    <div class="col-md-12" id="app">
                 @include('shared.messaged')
                    @yield('content')
                    </div>
                </div><!-- end of main-content -->
            </div><!-- Footer Start -->
            <div class="flex-grow-1"></div>
            <div class="app-footer">
                <div class="row">
                    <div class="col-md-9">
                        <p><strong>{{ config('app.name', '') }} CRM</strong></p>
                        <p>
                            <sunt></sunt>
                        </p>
                    </div>
                </div>
                <div class="footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center">
                    <span class="flex-grow-1"></span>
                    <div class="d-flex align-items-center">
                        <img class="logo" src="{{ asset('assets/images/logo-tacka.png') }}" alt="">
                        <div>
                            <p class="m-0">&copy; {{ Carbon\Carbon::now()->year }} {{ config('app.name', '') }}</p>
                            <p class="m-0">{{ trans('app.copyright') }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- fotter end -->
        </div>
    </div><!-- ============ Search UI Start ============= -->

    <!-- JS -->

    <script src="{{ asset('assets/js/plugins/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/scripts/script.min.js') }}"></script>
    <script src="{{ asset('assets/js/scripts/sidebar.large.script.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/echarts.min.js') }}"></script>
    <script src="{{ asset('assets/js/scripts/echart.options.min.js') }}"></script>
    <script src="{{ asset('assets/js/scripts/dashboard.v1.script.min.js') }}"></script>
    <script src="{{ asset('assets/js/scripts/customizer.script.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/spin.min.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/ladda.js') }}"></script>
    <!-- <script src="{{ asset('assets/js/scripts/ladda.script.js') }}"></script> -->
    <script src="{{ asset('assets/js/plugins/pickadate/picker.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/pickadate/picker.date.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>
