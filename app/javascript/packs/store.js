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
    allStores: [],
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
      app.allStores = app.stores
        console.log(app.allStores);
      },function(){
        alert('Sory');
      });
    },
    socketFilter: function(){
      app.isSocketFilterOn = !app.isSocketFilterOn
      app.refreshFilter();
    },
    wifiFilter: function(){
      app.isWifiFilterOn = !app.isWifiFilterOn
      app.refreshFilter();
    },
    refreshFilter: function(){
      var stores = [];
      if(app.isSocketFilterOn && app.isWifiFilterOn){
        var stores = app.allStores.filter(function(value){
          return value.socket && value.wifi
        });
      }else if(app.isSocketFilterOn && !app.isWifiFilterOn){
        var stores = app.allStores.filter(function(value){
          return value.socket
        });
      }else if(!app.isSocketFilterOn && app.isWifiFilterOn){
        var stores = app.allStores.filter(function(value){
          return value.wifi
        });
      }else if(!app.isSocketFilterOn && !app.isWifiFilterOn){
        var stores = app.allStores
      }else{
        alart("Error!");
      }
      app.stores = stores
    },
  },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    }
  }
});

