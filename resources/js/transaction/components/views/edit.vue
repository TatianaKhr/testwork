<template>
    <div v-if="loading" class="preloader">Loading...</div>
    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4">
                <form class="card-body" @submit.prevent="update">
                    <div class="card-title mb-3">Create Transaction</div>
                    <div>
                        <div class="col-md-12 form-group mb-3">
                            <label for="picker1">Type of transaction</label>
                            <select class="form-control" v-model="transaction.type">
                                <option value="1" :selected="transaction.type === 1">Deposit</option>
                                <option value="0" :selected="transaction.type === 0">Withdrawal</option>
                            </select>
                        </div>
                        <div class="col-md-12 form-group mb-3">
                            <label for="sum" class="ul-form__label">Sum of transaction</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">$</span>
                                </div>
                                <input type="number" min="0.00" max="10000.00" step="0.01"
                                       v-model="transaction.sum"/>
                            </div>
                        </div>
                        <div class="col-md-12 form-group mb-3">
                            <label>Date of transaction</label>
                            <VueDatePicker v-model="transaction.date_of_transaction"></VueDatePicker>
                        </div>
                        <div class="col-md-12 form-group mb-3">
                            <label for="user_id">User of transaction</label>
                            <select class="form-control" id="user_id" name="user_id" :size="selectSize"
                                    style="overflow-y: scroll;" v-model="transaction.user_id">
                                <option v-for="user in users" :key="user.id" :value="user.id">{{
                                        user.name
                                    }}
                                </option>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary" id="create">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>

import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import {get as getTransactions} from '../../../api/transaction'
import {update as updateTransactions} from '../../../api/transaction'
import {list as usersList} from '../../../api/user'

export default {
    components: {
        VueDatePicker
    },
    data() {
        return {
            transaction: {
                type: null,
                sum: 0,
                date_of_transaction: null,
                user_id: ''
            },
            maxSelectSize: 1,
            date: null,
            users: [],
            loading: true,
        }
    },
    mounted() {
        this.getTransaction();
        this.getUser();
    },
    methods: {
        async getTransaction() {
            await getTransactions(this.$route.params.id)
                .then(response => {
                    this.transaction = response.data.data;
                })
                .catch(error => {
                    this.transactions = [];
                });
        },
        getUser() {
            this.loading = true;
            usersList()
                .then(response => {
                    this.users = response.data.data;
                    this.loading = false;
                })
                .catch(error => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Something went wrong!',
                        footer: '<a href="/transaction">Why not reload the page ?</a>'
                    });
                    this.transaction = [];
                });
        },
        async update() {
            await updateTransactions(this.$route.params.id, this.transaction)
                .then(response => {
                    Swal.fire(
                        'Good job!',
                        'This transaction  have been create successfully !',
                        'success'
                    );
                    this.transaction = [];
                })
                .catch(error => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Something went wrong!',
                        footer: '<a href="/transactions">Why not reload the page ?</a>'
                    });
                });
        },
    },
    computed: {
        selectSize() {
            if (this.users.length < this.maxSelectSize) {
                return this.users.length;
            } else {
                return this.maxSelectSize;
            }
        },
    }
}
</script>

