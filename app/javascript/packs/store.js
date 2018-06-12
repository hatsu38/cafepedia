import Vue  from 'vue/dist/vue.esm.js'
import Index from '../components/index.vue'
import axios from 'axios'

var app = new Vue({
  el: '#stores_index',
  // components: {
  //   'store_list': Index,
  // },
  data: {
    stores: []
  },
  mounted: function(){
    this.fetchStores();
  },
  methods: {
    fetchStores: function(){
      axios.get('/api/stores').then(function(response){
        for(var i = 0; i < response.data.stores.length; i++){
          app.stores.push(response.data.stores[i]);
        }
      },function(){
        alert('Sory');
      });
    }
  },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    }
  }
});

