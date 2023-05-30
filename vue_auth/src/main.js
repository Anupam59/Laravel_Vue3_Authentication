import { createApp } from 'vue'
import App from './App.vue'
window.$ = window.jQuery = require('jquery')

import JQuery from 'jquery'
window.$ = JQuery

import router from './router'
import store from './store'
import axios from "axios";
import "bootstrap/dist/css/bootstrap.min.css"

import "bootstrap"
import 'vue3-toastify/dist/index.css';

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faUserSecret, faTrash,faEye } from '@fortawesome/free-solid-svg-icons'
library.add(faUserSecret,faTrash,faEye)

require('@/store/subscriber');
axios.defaults.baseURL = 'http://127.0.0.1:8000/api';

store.dispatch('auth/attempt',localStorage.getItem('token')).then(()=>{
    createApp(App)
        .use(store)
        .use(router)
        .component('font-awesome-icon', FontAwesomeIcon)
        .mount('#app');
});



