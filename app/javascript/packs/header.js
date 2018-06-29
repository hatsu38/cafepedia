import Vue  from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import axios from 'axios'
import router from './router/header_router.js'
Vue.use(VueRouter)

var app = new Vue({
  router,
  el: '#top_header',
});
