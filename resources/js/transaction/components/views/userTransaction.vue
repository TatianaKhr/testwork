<template>
    <div class="row">
        <div class="col-md-9">
            <div class="card mb-4">
                <div class="card-header">
                    <span
                        class="badge badge-success p-2 m-2">Transactions List of user {{ user.name }} {{
                            user.last_name
                        }} </span>
                </div>
                <div class="card-body">
                    <table class="table" id="users_list">
                        <thead>
                        <tr>
                            <th>Number</th>
                            <th>Type of transaction</th>
                            <th>Sum of transaction</th>
                            <th>Date of transaction</th>
                        </tr>
                        </thead>
                        <tbody v-if="transactions.length>0">
                        <tr v-for="(transaction, index)  in transactions">
                            <td>{{ index + 1 }}</td>
                            <td>{{ getTransactionType(transaction.type) }}</td>
                            <td>{{ transaction.sum }}</td>
                            <td>{{ transaction.date_of_transaction }}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import {get as getUser} from '../../../api/user'

export default {
    data() {
        return {
            transactions: [],
            user: [],
        }
    },
    mounted() {
        this.get();
    },
    methods: {
        async get(id) {
            await getUser(this.$route.params.id)
                .then(response => {
                    this.transactions = response.data.data.transactions;
                    this.user = response.data.data;
                })
                .catch(error => {
                    this.transactions = [];
                })
        },
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
