@if ($errors->any())
    <div class="alert alert-danger">
    <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
        
    </div>
@endif

@if (session('status'))

    <div class="alert alert-success" role="alert">
        {{ Lang::get('shared.status_'.session('status')) }}
        <button class="close" type="button" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
    </div>

@endif