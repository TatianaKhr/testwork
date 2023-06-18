@extends('layouts.default')

@section('content')

    @include('users.breadcrumbs')

    @if($user)
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body" data-id="{{ $user['id'] }}" id="user-card">
                        <div class="card-title mb-3">{{ trans('users.update') }}</div>
                        <div>
                            <div class="row">
                                <div class="col-md-6 form-group mb-3">
                                    <label for="name">{{ trans('users.name') }}</label>
                                    <input type="text" class="form-control" id="name" value="{{ $user['name'] }}">
                                </div>

                                <div class="col-md-6 form-group mb-3">
                                    <label for="lastName">{{ trans('users.last_name') }}</label>
                                    <input type="text" class="form-control" id="lastName"
                                           value="{{ $user['last_name'] }}">
                                </div>

                                <div class="col-md-6 form-group mb-3">
                                    <label for="email">{{ trans('users.email') }}</label>
                                    <input type="email" class="form-control" id="email" value="{{ $user['email'] }}">
                                </div>

                                <div class="col-md-6 form-group mb-3">
                                    <label for="phone">{{ trans('users.phone') }}</label>
                                    <input type="tel" class="form-control" id="phone" value="{{ $user['phone'] }}">
                                </div>

                                <div class="col-md-6 form-group mb-3">
                                    <label for="password">{{ trans('users.password') }}</label>
                                    <input type="password" class="form-control" id="password"
                                           placeholder="Password">
                                </div>

                                <div class="col-md-6 form-group mb-3">
                                    <label for="password_confirmation">{{ trans('users.password_compare') }}</label>
                                    <input type="password" class="form-control" id="password_confirmation"
                                           placeholder="Confirm password">
                                </div>

                                <div class="form-group col-md-6">
                                    <div class="ml-1 row ">
                                        <label> {{ trans('users.update_roles')}} </label>
                                        <div class="col-sm-10">
                                            @foreach($usersRoles as $role)
                                                <div
                                                    class="form-check {{ $role['hidden'] === 1 ? 'disabled' : '' }}">
                                                    @if($user->roles)
                                                        @foreach($user->roles as $userRole)
                                                            <input class="form-check-input" type="radio"
                                                                   name="gridRadios"
                                                                   id="gridRadios1"
                                                                   value="{{ $role['id'] }}" {{ $role['hidden'] === 1 ? 'disabled' : ($userRole['id'] == $role['id'] ? 'checked' : '') }}>
                                                        @endforeach
                                                    @else
                                                        <input class="form-check-input" type="radio" name="gridRadios"
                                                               id="gridRadios1"
                                                               value="{{ $role['id'] }}" {{ $role['hidden'] === 1 ? 'disabled'  : '' }}>
                                                    @endif
                                                    <label class="form-check-label" for="gridRadios1">
                                                        {{$role['title'] }}
                                                    </label>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 form-group mb-3">
                                    <label for="website">{{ trans('users.profile_image') }}</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="profile_image">
                                        <label class="custom-file-label" for="profile_image">Choose
                                            file</label>
                                    </div>
                                    <img src="/storage/{{ $user['profile_image'] }}" width="100"
                                         class="img-fluid img-thumbnail">
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary" id="update_btn">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection

<script type="module">
    $(document).ready(function () {

        let userId = $('.card-body').data('id');

        function validateEmail(email) {
            let regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }

        $('#profile_image').on('change', function () {
            let fileName = $(this).val().split('\\').pop();
            $(this).next('.custom-file-label').html(fileName);
        });

        $('#update_btn').on("click", function (event) {
            let formData = new FormData();

            let email = $('#email').val().trim();
            let name = $('#name').val().replace(/[^\w\s]/gi, '');
            let lastName = $('#lastName').val().replace(/[^\w\s]/gi, '');
            let emailVerified = validateEmail(email) ? email : null;
            let phone = $('#phone').val().replace(/\D/g, '');
            let password = $('#password').val();
            let passwordConfirmation = $('#password_confirmation').val();
            let role = $("input[name='gridRadios']:checked").val();

            if ($('#profile_image')[0].files && $('#profile_image')[0].files[0]) {
                formData.append("profile_image", $('#profile_image')[0].files[0]);
            }

            if (password !== '' && passwordConfirmation !== '') {
                formData.append("password", password);
                formData.append("password_confirmation", passwordConfirmation);
            }

            if (validateEmail(email)) {
                formData.append("email", email);
            }

            formData.append("name", name);
            formData.append("phone", phone);
            formData.append("last_name", lastName);
            formData.append("role", role);

            $.ajax({
                url: `/users/${userId}`,
                method: 'post',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    Swal.fire(
                        'Good job!',
                        'New user has been updated successfully!',
                        'success'
                    ).then(function () {
                        window.location.href = "/users";
                    });
                },
                error: function (data) {
                    $.each(data.responseJSON.data, function (fieldName, error) {
                        $('#user-card').find('[name=' + fieldName + ']').addClass('is-invalid').after(`<div class=" invalid-feedback"> ${error} </div>`);
                    })
                }
            });
        });
    });
</script>
