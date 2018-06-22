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
    currentPage: 0,
    size: 10,
    pageRange: 10,
  },
  created: function(){
    this.fetchStores();
  },
  computed: {
    pages: function(){
      return  Math.ceil(this.stores.length/this.size);
    },
    displayPageRange: function(){
      const half = Math.ceil(this.pageRange / 2);
      let start, end;
      if (this.pages < this.pageRange) {
        // ページネーションのrangeよりページ数がすくない場合
        start = 1;
        end = this.pages;
      } else if (this.currentPage < half) {
        // 左端のページ番号が1になったとき
        start = 1;
        end = start + this.pageRange - 1;
      } else if (this.pages - half < this.currentPage) {
        // 右端のページ番号が総ページ数になったとき
        end = this.pages;
        start = end - this.pageRange + 1;
      } else {
        // activeページを中央にする
        start = this.currentPage - half + 1;
        end = this.currentPage + half;
      }
      let indexes = [];
      for (let i = start; i <= end; i++) {
        indexes.push(i);
      }
      return indexes;
    },
    displayStores: function(){
      const head = this.currentPage * this.size;
      return this.stores.slice(head,head+this.size);
    },
    isSelected(page){
      return page - 1 === this.currentPage;
    },
    selectHandler () {
    }
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
      app.first();
    },
    wifiFilter: function(){
      app.onWifi = !app.onWifi
      app.refreshFilter();
      app.first();
    },
    refreshFilter: function(){
      var search_stores = app.wordListupStores();
      app.stores = app.filterListupStores(search_stores);
      // app.inOrderFadein();
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
      app.first();
      // app.inOrderFadein();
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
    },
    infiniteScroll (event) {
      // スクロールの現在位置 + 親（.item-container）の高さ >= スクロール内のコンテンツの高さ
      console.log(event.target.scrollTop);
      if ((event.target.scrollTop + event.target.offsetHeight) >= event.target.scrollHeight) {
        // this.fetch();
      const head = this.currentPage * this.size;
      return this.stores.slice(head,head+this.size);
      }
    },
    first () {
      this.currentPage = 0;
      this.selectHandler();
    },
    /**
     * ページ後尾に移動する
     */
    last () {
      this.currentPage = this.pages - 1;
      this.selectHandler();
    },
    /**
     * 1ページ前に移動する
     */
    prev () {
      if (0 < this.currentPage) {
        this.currentPage--;
        this.selectHandler();
      }
    },
    /**
     * 1ページ次に移動する
     */
    next () {
      if (this.currentPage < this.pages - 1) {
        this.currentPage++;
        this.selectHandler();
      }
    },
    /**
     * 指定したページに移動する
     * @param {number} index ページ番号
     */
    pageSelect (index) {
      this.currentPage = index - 1;
      this.selectHandler();
    },
  },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    }
  }
});

