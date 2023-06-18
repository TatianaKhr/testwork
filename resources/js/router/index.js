import { createRouter, createWebHistory } from 'vue-router'
import container from "../transaction/index.vue";
import list from "../transaction/components/views/list.vue";
import create from "../transaction/components/views/create.vue";
import edit from "../transaction/components/views/edit.vue";
import breadcrumb from "../transaction/components/shared/breadcrumb.vue";
import users from "../transaction/components/views/users.vue";
import userTransaction from "../transaction/components/views/userTransaction.vue";

export const routes = [
    {
        path: "/transactions",
        redirect: '/transactions/list',
        component: breadcrumb,
        children: [
            {path: '/transactions/list', name: 'list', component: list},
            {path: '/transactions/create', name: 'create', component: create},
            {path: '/transactions/:id/edit', name: 'edit', component: edit},
            {path: '/transactions/users', name: 'users', component: users},
            {path: '/transactions/user/:id', name: 'user transactions', component: userTransaction},
        ]
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
})

export default router;
