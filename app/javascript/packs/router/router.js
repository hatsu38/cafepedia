import VueRouter from 'vue-router'
import Vue from 'vue'
import Index from '../components/index.vue'
// import Show from '../components/show.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    // { path: '/task/:id', component: Show },
  ],
})
