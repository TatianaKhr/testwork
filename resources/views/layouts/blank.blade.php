<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>{{ config('app.name', '') }}</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="{{ asset('assets/css/themes/lite-green.min.css?v=2') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/perfect-scrollbar.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/ladda-themeless.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/fontawesome/css/fontawesome.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/fontawesome/css/light.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/pickadate/classic.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/plugins/pickadate/classic.date.css') }}" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="{{ asset('assets/js/plugins/jquery-3.3.1.min.js') }}"></script>
    <link rel="icon" type="image/x-icon" href="{{ asset('favicon.ico') }}">

</head>

<style type="text/css">body,html {
  height: 100%;
}</style>

<body>

    @yield('content')

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
    
</body>

</html>