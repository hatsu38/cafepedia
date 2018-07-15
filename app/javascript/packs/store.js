import Vue  from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import axios from 'axios'
import router from './router/router.js'
import VModal from 'vue-js-modal'
Vue.use(VueRouter)
Vue.use(VModal,{dynamic: true })

var app = new Vue({
  router,
  el: '#stores_index',
});

