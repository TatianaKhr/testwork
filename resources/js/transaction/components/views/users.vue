<template>
    <div class="row">
        <div class="col-md-8 mb-4">
            <div class="card text-left">
                <div class="card-body">
                    <div class="table-responsive">
                        <div id="ul-contact-list_wrapper"
                             class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="ul-contact-list" class="display table dataTable no-footer"
                                           style="width:100%" role="grid" aria-describedby="ul-contact-list_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="ul-contact-list"
                                                rowspan="1" colspan="1" aria-sort="ascending" scope="row"
                                                aria-label="Name: activate to sort column descending"
                                                style="width: 136.281px;">Name
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="ul-contact-list" rowspan="1"
                                                colspan="1" aria-label="Email: activate to sort column ascending"
                                                scope="row"
                                                style="width: 170.922px;">Email
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="ul-contact-list" rowspan="1"
                                                scope="row"
                                                colspan="1" aria-label="Phone: activate to sort column ascending"
                                                style="width: 104.734px;">Phone
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="ul-contact-list" rowspan="1"
                                                scope="row"
                                                colspan="1" aria-label="Role: activate to sort column ascending"
                                                style="width: 96.7656px;">Transaions
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr role="row" class="odd" v-for="user in users">
                                            <td>{{ user.name }} {{ user.last_name }}</td>
                                            <td>{{ user.email }}</td>
                                            <td>{{ user.phone }}</td>
                                            <td>
                                                <router-link :to='{name:"user transactions",params:{id:user.id}}'
                                                             class="badge badge-primary  p-2">Transactions
                                                </router-link>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-5">
                                </div>
                                <div class="col-sm-12 col-md-7">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import {list as usersList} from '../../../api/user'

export default {
    data() {
        return {
            users: [],
        }
    },
    mounted() {
        this.get();
    },
    methods: {
        async get() {
            await usersList()
                .then(response => {
                    this.users = response.data.data;
                }).catch(error => {
                    this.users = [];
                });
        },
    },
}
</script>
