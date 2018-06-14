import Vue  from 'vue/dist/vue.esm.js'
import Index from '../components/index.vue'
import axios from 'axios'

var app = new Vue({
  el: '#stores_index',
  data: {
    stores: [],
    allStores: [],
    onSocket: false,
    onWifi: false,
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
      app.onSocket = !app.onSocket
      app.refreshFilter();
    },
    wifiFilter: function(){
      app.onWifi = !app.onWifi
      app.refreshFilter();
    },
    refreshFilter: function(){
      var stores_list =[];
      var search_stores = app.wordListupStores();
      if(app.onSocket && app.onWifi){
        stores_list = search_stores.filter(function(value){
          return value.socket && value.wifi
        });
      }else if(app.onSocket && !app.onWifi){
        stores_list = search_stores.filter(function(value){
          return value.socket
        });
      }else if(!app.onSocket && app.onWifi){
        stores_list = search_stores.filter(function(value){
          return value.wifi
        });
      }else if(!app.onSocket && !app.onWifi){
        stores_list = search_stores
      }else{
        alart("Error!");
      }
      app.stores = stores_list
    },
    searchStores: function(){
      app.wordListupStores();
      app.resetFilter();
    },
    wordListupStores: function(){
      var searchWord = this.storeSearch && this.storeSearch.toLowerCase();
      if(!searchWord){
        return app.stores = app.allStores
      }
      var stores_list = app.allStores.filter(function(value){
        return Object.keys(value).some(function(key){
          if(key === 'name'){
            return String(value[key]).toLowerCase().indexOf(searchWord) > -1
          }
        })
      })
      return app.stores = stores_list
    },
    resetFilter: function(){
      app.onSocket= false
      app.onWifi = false
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

