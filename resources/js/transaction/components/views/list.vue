<template>
    <div class="row">
        <div class="col-md-9">
            <div class="card mb-4">
                <div class="card-header"><span class="badge badge-success p-2 m-1">Transactions List</span></div>
                <div class="card-body">
                    <table class="table" id="users_list">
                        <thead>
                        <tr>
                            <th>Number</th>
                            <th>Type of transaction</th>
                            <th>Sum of transaction</th>
                            <th>Date of transaction</th>
                            <th>User of transaction</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody v-if="transactions.length>0">
                        <tr v-for="(transaction, index)  in transactions">
                            <td>{{ index + 1 }}</td>
                            <td>{{ getTransactionType(transaction.type) }}</td>
                            <td>{{ transaction.sum }}</td>
                            <td>{{ transaction.date_of_transaction }}</td>
                            <td> {{ transaction.user_id }}</td>
                            <td>
                                <router-link :to='{name:"edit",params:{id:transaction.id}}'><i
                                    class="fas fa-edit mr-4"></i></router-link>
                                <button type="button" @click="deleteTransaction(transaction.id)"
                                        class="btn btn-transparent"><i
                                    class="nav-icon i-Close-Window font-weight-bold"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-center card-header">
                    <TailwindPagination
                        :data="data"
                        @pagination-change-page="getResults"
                    />
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import {TailwindPagination} from 'laravel-vue-pagination';
import {list as listTransaction} from '../../../api/transaction'
import {destroy as deleteTransactions} from '../../../api/transaction'

export default {
    components: {
        TailwindPagination
    },
    data() {
        return {
            transactions: [],
            data: {},
        }
    },
    mounted() {
        this.get();
    },
    methods: {
        async get() {
            await listTransaction()
                .then(response => {
                    this.transactions = response.data.data;
                    this.data = response.data;
                    this.getResults();
                }).catch(error => {
                    this.transactions = [];
                });
        },
        async delete(id) {
            const result = await Swal.fire({
                title: 'Are you sure?',
                text: 'Are you sure you want to delete this transaction?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel',
            });
            if (result.isConfirmed) {
                deleteTransactions(id)
                    .then(() => {
                        Swal.fire('Deleted!', 'The transaction has been deleted.', 'success');
                        this.get();
                    })
                    .catch(error => {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                            footer: '<a href="/transaction">Why not reload the page ?</a>'
                        });
                    });
            }
        },
        async getResults(page = 1) {
            const response = await fetch(`/api/transactions?page=${page}`);
            this.data = await response.json();
            this.transactions = this.data.data;
        }
    },
    computed: {
        getTransactionType() {
            return (type) => {
                return type === 1 ? 'Deposit' : 'Withdrawal';
            };
        }
    }
}
</script>
