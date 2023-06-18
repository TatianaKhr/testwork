<script setup>

</script>

<template>
    <div class="breadcrumb">
        <h1 class="mr-2">Transactions</h1>
        <ul>
            <li><i class="nav-icon i-File-Horizontal-Text"></i>
                <router-link to="/transactions/list">Transaction list</router-link>
            </li>
            <li><i class="nav-icon i-Add"></i>
                <router-link to="/transactions/create">Create transaction</router-link>
            </li>
            <li><i class="nav-icon fa-solid fa-users"></i>
                <router-link to="/transactions/users">Users</router-link>
            </li>
        </ul>
    </div>
    <div class="separator-breadcrumb border-top">
        <router-view></router-view>
    </div>
</template>
