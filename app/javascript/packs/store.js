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
      var search_stores = app.wordListupStores();
      app.stores = app.filterListupStores(search_stores);
      app.inOrderFadein();
    },
    filterListupStores: function(search_stores){
      var stores_list =[];
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
      return stores_list
    },
    searchStores: function(){
      var search_stores = app.wordListupStores();
      app.stores = app.filterListupStores(search_stores);
      $('#aria').blur();
      app.inOrderFadein();
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
      return stores_list
    },
    resetFilter: function(){
      app.onSocket= false
      app.onWifi = false
    },
    inOrderFadein: function(){
    $('#stores .store').hide();
      $('#stores .store').each(function(i){
        $(this).delay(180 * i).fadeIn(500);
      });
    }
  },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    }
  }
});

