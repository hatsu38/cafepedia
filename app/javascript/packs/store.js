import Vue  from 'vue/dist/vue.esm.js'
import Index from '../components/index.vue'
import axios from 'axios'

var app = new Vue({
  el: '#stores_index',
  data: {
    stores: [],
    allStores: [],
    isSocketFilterOn: false,
    isWifiFilterOn: false,
    storeSearch: '',
  },
  created: function(){
    this.fetchStores();
  },
  methods: {
    fetchStores: function(){
      axios.get('/api/stores').then(function(response){
        for(var i = 0; i < response.data.stores.length; i++){
          app.stores.push(response.data.stores[i]);
        }
        app.allStores = app.stores
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
    filterStores: function(){
      var stores = [];
      var searchWord = this.storeSearch && this.storeSearch.toLowerCase();
      console.log(searchWord);
      if(searchWord){
        stores = app.allStores.filter(function(value){
          return Object.keys(value).some(function(key){
            if(key === 'name'){
            return String(value[key]).toLowerCase().indexOf(searchWord) > -1
            }
          })
        })
        return app.stores = stores
      }
      return app.stores = app.allStores
    }
  },
  // computed: {
  //   filterStores: function(){
  //     var stores = [];
  //     var searchWord = this.storeSearch && this.storeSearch.toLowerCase();
  //     console.log(searchWord);
  //     if(searchWord){
  //       stores = app.allStores.filter(function(value){
  //         return Object.keys(value).some(function(key){
  //           if(key === 'name'){
  //           return String(value[key]).toLowerCase().indexOf(searchWord) > -1
  //           }
  //         })
  //       })
  //       return app.stores = stores
  //     }
  //     return app.stores = app.allStores
  //   }
  // },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    }
  }
});

