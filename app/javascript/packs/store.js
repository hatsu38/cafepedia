import Vue  from 'vue/dist/vue.esm.js'
import Index from '../components/index.vue'
import axios from 'axios'

var app = new Vue({
  el: '#stores_index',
  // components: {
  //   'store_list': Index,
  // },
  data: {
    stores: [],
    isSocketFilterOn: false,
    isWifiFilterOn: false
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
    },
    socketFilter: function(){
      var stores = []
      this.stores.filter(function(value){
        if(value.socket == true){
          stores.push(value);
        }
      });
      app.stores = stores
      app.isSocketFilterOn = !app.isSocketFilterOn
    },
    wifiFilter: function(){
      var stores = []
      this.stores.filter(function(value){
        if(value.wifi == true){
          stores.push(value);
        }
      });
      app.stores = stores
      app.isWifiFilterOn = !app.isWifiFilterOn
    },
  },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    }
  }
});

