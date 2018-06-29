<template>
  <div>
    <header class="center white-text" id="top_header">
      <router-link to="/" class="white-text">
        <i class="fas fa-smoking"></i>
        <h1 class="logo">喫煙カフェ</h1>
      </router-link>
    </header>

    <div class="search_box">
      <div class="row search-form">
        <form class="input-field col s10"
              action="/"
              onsubmit="return false"
              @submit.prevent="searchStores">
          <input
              type="search"
              id="aria"
              v-model="storeSearch"
              >
              <label for="aria">エリア・駅</label>
        </form>
        <a class="btn waves-effect waves-light col s2 input-field"
           @click="searchStores">検索</a>
      </div>
    </div>
    <div class="filter_box row center">
      <div class="filter-block col s6">
        <div class="filter_content sort"
             @click="socketFilter"
             :class="{socketFilterOn: onSocket}"
             >
             <i class="fas fa-plug"></i>
             コンセント
        </div>
      </div>
      <div class="filter-block col s6">
        <div class="filter_content sort"
             @click="wifiFilter"
             :class="{wifiFilterOn: onWifi}"
             >
             <i class="fas fa-wifi"></i>
             フリーWi-Fi
        </div>
      </div>
    </div>

    <div class="stores_box" id="stores">
    <div class="store_count">{{stores.length}}店舗</div>
      <div class="store mix"
           v-for="(store,index) in displayStores"
           :class="{socket: store.socket,wifi: store.wifi}"
           >
          <h2><router-link :to="'/stores/' + store.id">{{store.name}}</router-link></h2>
          <div class="row">
            <div class="col s5 mainstore_logo">
              <img :src="store.mainstore.image.url">
            </div>
            <div class="col s7">
              <table class="table">
                <tbody>
                  <tr>
                     <th><i class="fas fa-clock"></i></th>
                     <td>
                       <pre>{{store.business_hour}}</pre>
                     </td>
                   </tr>
                   <tr>
                     <th><i class="fas fa-map-marker-alt"></i></th>
                     <td>
                       {{store.access | access_cut}}
                     </td>
                   </tr>
                 </tbody>
               </table>
             </div>
           </div>
           <div class="icons_box">
             <i class="fas fa-smoking" v-show="store.smoking"></i>
             <i class="fas fa-wifi" v-show="store.wifi"></i>
             <i class="fas fa-plug" v-show="store.socket"></i>
             <div class="iccard_img_block" v-show="store.iccard">
               <img src="/uploads/iccard_service.jpg" class="iccard_icon">
             </div>
          </div>
      </div>
    </div>
    <div class="moreread" @click="moreread" v-show="moreread_desp">
    <i class="fas fa-angle-down"></i><span>もっとみる</span>
    </div>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  data: function(){
  return {
    stores: [],
    allStores: [],
    onSocket: false,
    onWifi: false,
    storeSearch: '',
    currentPage: 0,
    size: 10,
    pageRange: 5,
    moreread_desp: true,
    }
  },
  mounted: function(){
    this.fetchStores();
  },
  computed: {
    //ページネーション系メソッド
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
      //ページネーション系
      // const head = this.currentPage * this.size;
      // return this.stores.slice(head,head+this.size);
      // もっと読む系
      return this.stores.slice(0,this.size)
    },
    isSelected(page){
      return page - 1 === this.currentPage;
    },
  },
  methods: {
    fetchStores: function(){
      axios.get('/api/stores').then((response)=>{
        for(var i = 0; i < response.data.stores.length; i++){
          this.stores.push(response.data.stores[i]);
        }
        this.allStores = this.stores
      },(error) =>{
        alert('Sory');
      });
    },
    socketFilter: function(){
      this.onSocket = !this.onSocket
      this.refreshFilter();
    },
    wifiFilter: function(){
      this.onWifi = !this.onWifi
      this.refreshFilter();
    },
    refreshFilter: function(){
      var search_stores = this.wordListupStores();
      this.stores = this.filterListupStores(search_stores);
    },
    filterListupStores: function(search_stores){
      var stores_list =[];
      if(this.onSocket && this.onWifi){
        stores_list = search_stores.filter(function(value){
          return value.socket && value.wifi
        });
      }else if(this.onSocket && !this.onWifi){
        stores_list = search_stores.filter(function(value){
          return value.socket
        });
      }else if(!this.onSocket && this.onWifi){
        stores_list = search_stores.filter(function(value){
          return value.wifi
        });
      }else if(!this.onSocket && !this.onWifi){
        stores_list = search_stores
      }else{
        alart("Error!");
      }
      return stores_list
    },
    searchStores: function(){
      var search_stores = this.wordListupStores();
      this.stores = this.filterListupStores(search_stores);
      $('#aria').blur();
      this.get_moreread_desp();
      this.size = 10
    },
    wordListupStores: function(){
      var searchWord = this.storeSearch && this.storeSearch.toLowerCase();
      if(!searchWord){
        return this.stores = this.allStores
      }
      var stores_list = this.allStores.filter(function(value){
        return Object.keys(value).some(function(key){
          if(key === 'name' || key === "city" || key === "other_address" || key === "access"){
            return String(value[key]).toLowerCase().indexOf(searchWord) > -1
          }
        })
      })
      return stores_list
    },
    resetFilter: function(){
      this.onSocket= false
      this.onWifi = false
    },
    inOrderFadein: function(){
      $('#stores .store').hide();
      $('#stores .store').each(function(i){
        $(this).delay(180 * i).fadeIn(500);
      });
    },
    //ページネーション系メソッド
    first () {
      this.currentPage = 0;
    },
    last () {
      this.currentPage = this.pages - 1;
    },
    prev () {
      if (0 < this.currentPage) {
        this.currentPage--;
      }
    },
    next () {
      if (this.currentPage < this.pages - 1) {
        this.currentPage++;
      }
    },
    pageSelect (index) {
      this.currentPage = index - 1;
    },
    //もっと読むメソッド
    moreread (){
      this.size += 10
      this.get_moreread_desp();
    },
    get_moreread_desp (){
      if(this.displayStores.length >= this.stores.length){
        return this.moreread_desp = false
      }
      return this.moreread_desp = true
    },
  },
  filters: {
    moment: function(data){
      return moment(data).format('HH:mm');
    },
    access_cut: function(data){
      if(!data){
        return data
      }
      if(data.match(/.+?[0-9]分|.+?[0-9]km/)){
        return data.substr(0,data.search("[0-9]分|km")+2);
      }
      return data
    }
  }
};
</script>
