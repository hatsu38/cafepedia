import Vue  from 'vue/dist/vue.esm.js'
import Index from './components/index.vue'
import axios from 'axios'
import router from './router/router'
var app = new Vue({
  router,
  el: '#stores_index',
  components:{
    'top-component': Index,
  }
});

