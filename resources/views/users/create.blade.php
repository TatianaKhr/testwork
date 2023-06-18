@extends('layouts.default')

@section('content')


    @include('users.breadcrumbs')

<div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-body" id="user-card">
                    <div class="card-title mb-3">{{ trans('users.create') }}</div>
                    <div>
                        <div class="row">
                            <div class="col-md-6 form-group mb-3">
                                <label for="name">{{ trans('users.name') }}</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="lastName">{{ trans('users.last_name') }}</label>
                                <input type="text" class="form-control" id="lastName"  name="last_name" placeholder="Enter last name">
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="email">{{ trans('users.email') }}</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="phone">{{ trans('users.phone') }}</label>
                                <input type="tel" class="form-control" id="phone" placeholder="Enter phone" name="phone">
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="password">{{ trans('users.password') }}</label>
                                <input  type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="password_confirmation">{{ trans('users.password_compare') }}</label>
                                <input  type="password" class="form-control" id="password_confirmation"  name="password_confirmation" placeholder="Confirm password">
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="website">{{ trans('users.profile_image') }}</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="profile_image" name="profile_image">
                                    <label class="custom-file-label" for="profile_image">Choose
                                        file</label>
                                </div>
                            </div>


                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" id="create">Create</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

<script type="module">

    $(document).ready(function () {
        function validateEmail(email) {
            let regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }

        $('#profile_image').on('change', function() {
            let fileName = $(this).val().split('\\').pop();
            $(this).next('.custom-file-label').html(fileName);
        });

        $('#create').on("click", function (event) {
            let formData = new FormData();

            let name = $('#name').val().replace(/[^\w\s]/gi, '');
            let lastName = $('#lastName').val().replace(/[^\w\s]/gi, '');
            let email = $('#email').val().trim();
            let phone = $('#phone').val().replace(/\D/g, '');
            let password = $('#password').val();
            let passwordConfirmation = $('#password_confirmation').val();
            let profileImage = $('#profile_image')[0].files[0];

            formData.append("name", name);
            formData.append("phone", phone);
            formData.append("last_name", lastName);
            formData.append("password", password);
            formData.append("password_confirmation", passwordConfirmation);
            formData.append("profile_image", profileImage);

            if (validateEmail(email)) {
                formData.append("email", email);
            }

            $.ajax({
                url: `/users`,
                method: 'post',
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    Swal.fire(
                        'Good job!',
                        'New user  have been create successfully !',
                        'success'
                    ).then(function() {
                        window.location.href = "/users";
                    });
                },
                error: function (data) {
                    $.each(data.responseJSON.data, function (fieldName, error) {
                        $('#user-card').find('[name=' + fieldName + ']').addClass('is-invalid').after(`<div class=" invalid-feedback"> ${ error } </div>`);
                    })
                }
            });
        });
    });
</script>
