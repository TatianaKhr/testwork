import './bootstrap';

import { createApp } from 'vue';
import router from './router/index'
import VueAxios from 'vue-axios';
import index  from './transaction/index.vue'
import axios from 'axios';
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

createApp(index).use(router).use(VueAxios, axios, VueSweetalert2).mount('#app')

