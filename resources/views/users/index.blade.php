@extends('layouts.default')

@section('content')

    @include('users.breadcrumbs')

    <div class="mb-4">
        <button type="button" class="btn-url btn btn-primary"
                data-url="{{ route('users.view.create') }}">{{ trans('users.add_user') }} +
        </button>
    </div>

    <div class="row">
        <div class="col-md-9">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="card-title mb-3">{{ trans('shared.search') }}</div>
                    <form class="users-filter">
                        <div class="row">
                            <div class="col-md-6 form-group mb-3">
                                <label>{{ trans('users.search_input') }}</label>
                                <select class="form-control" name="user">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    @if($users->count())
        <div class="row">
            <div class="col-md-9">
                <div class="card mb-4">
                    <div class="card-header"><span class="badge badge-success p-2 m-1">{{ trans('users.list') }}</span>
                    </div>
                    <div class="card-body">
                        <table class="table" id="users_list">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>{{ trans('users.name') }}</th>
                                <th>{{ trans('users.last_name') }}</th>
                                <th>{{ trans('users.phone') }}</th>
                                <th>{{ trans('users.action') }}</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($users as $user)
                                <tr>
                                    <td>{{ $user->id }}</td>
                                    <td><a href="#">{{ $user->name }}</a></td>
                                    <td>{{ $user->last_name }}</td>
                                    <td>{{ $user->phone }}</td>
                                    <td>
                                        <a href="{{ route('users.edit', ['user' => $user->id]) }}"><i
                                                class="fas fa-edit mr-4 "></i></a>
                                        {{--                               <a href="{{ route('users.destroy', ['user' => $user->id]) }}"><i  class="nav-icon i-Close-Window font-weight-bold"></i></a>--}}
                                        <span id="delete-btn" data-id="{{ $user->id }}"><i
                                                class="nav-icon i-Close-Window font-weight-bold"></i></span>
                                    </td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        {!! $users->links() !!}

    @endif

@endsection

<script type="module">

    $(document).ready(function () {
        $('#users_list').on("click", "#delete-btn", function () {

            let userId = $(this).data('id');

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {

                    $.ajax({
                        url: `/users/${userId}`,
                        method: 'delete',
                        dataType: 'json',
                        data: {},
                        success(data) {
                            Swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                            window.location.href = "/users";
                        },
                        error(data) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Something went wrong!',
                                footer: '<a href="/">Why not reload the page ?</a>'
                            })
                        }
                    });
                }
            })
        });

    });
</script>
