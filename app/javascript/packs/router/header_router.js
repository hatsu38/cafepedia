import VueRouter from 'vue-router'
import Vue from 'vue'
// import Header from '../components/header.vue'
console.log("header_router");
export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Header},
    { path: '/stores/:id', component: Header},
  ],
})
