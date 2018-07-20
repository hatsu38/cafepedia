<template>
  <div>
    <div id="index_vue">
      <header class="center white-text" id="top_header">
        <router-link to="/" class="white-text">
          <i class="fas fa-coffee"></i>
          <h1 class="logo">カフェペディア</h1>
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
                id="area"
                v-model="searchWord"
                >
                <label for="area">エリア・駅</label>
          </form>
          <a class="btn waves-effect waves-light col s2 input-field"
             @click="searchStores">検索</a>
        </div>
      </div>
      <div class="filter_box row center">
        <div class="filter-block col s4 socket">
          <div class="filter_content sort"
               @click="socketFilter"
               :class="{socketFilterOn: onSocket}"
               >
               <i class="fas fa-plug"></i>
               <span>コンセント</span>
          </div>
        </div>
        <div class="filter-block col s4 wifi">
          <div class="filter_content sort"
               @click="wifiFilter"
               :class="{wifiFilterOn: onWifi}"
               >
               <i class="fas fa-wifi"></i>
               <span>フリーWi-Fi</span>
          </div>
        </div>
        <div class="filter-block col s4 smoking">
          <div class="filter_content sort"
               @click="smokingFilter"
               :class="{smokingFilterOn: onSmoking}"
               >
              <i class="fas fa-smoking"></i>
              <span class="smoking_filter_text">喫煙席</span>
          </div>
        </div>
        <div class="filter-block col s12 distanceSort">
          <div class="filter_content sort"
               @click="refreshDistanceCalc"
               :class="{distanceSortOn: onDistanceSort}"
              >
              <i class="fas fa-location-arrow"></i>
              <span>現在地から近い順に並び替え</span>
          </div>
        </div>
      </div>
      <div class="stores_box" id="stores">
        <div class="store_count">{{stores.length}}店舗</div>
        <div id="stores_array">
          <div class="store "
               v-for="(store,index) in displayStores"
               :class="{socket: store.socket,wifi: store.wifi}"
               >
               <h2 v-if="pc"><router-link :to="'/stores/' + store.id">{{store.name}}</router-link></h2>
               <h2 @click="modal_open(store)" v-else>{{store.name}}</h2>
               <div class="row">
                 <div class="col s5 mainstore_logo">
                   <img :src="store.mainstore.image.url">
                 </div>
                 <div class="col s7">
                   <table class="table" >
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
                       <tr v-show="store.distance != undefined">
                         <th><i class="fas fa-location-arrow"></i></th>
                         <td>
                           約 {{store.distance | km_convert}}
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
      </div>
      <div class="moreread" @click="moreread" v-show="moreread_desp">
        <i class="fas fa-angle-down"></i><span>もっとみる</span>
      </div>
    </div>
    <modals-container></modals-container>
    <div id="loading_anime">
      <div class="loading_block">
        <img src="loading_2.gif">
      </div>
      <p id="loading_text">
        <span>現</span>
        <span>在</span>
        <span>地</span>
        <span>か</span>
        <span>ら</span>
        <span>カ</span>
        <span>フ</span>
        <span>ェ</span>
        <span>を</span>
        <span>検</span>
        <span>索</span>
        <span>中</span>
        <span>.</span>
        <span>.</span>
        <span>.</span>
      </p>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
import pickStoreComponent from './pickStoreComponent'
export default {
  data: function(){
    return {
      stores: [],
      allStores: [],
      onSocket: false,
      onWifi: false,
      onSmoking: false,
      onDistanceSort: false,
      searchWord: '',
      size: 10,
      moreread_desp: true,
      pickStore: '',
      pc: false,
    }
  },
  updated: function(){
    this.saveStorageCondition();
  },
  created: function(){
    this.isPc();
  },
  mounted: function(){
    var allStoresList = JSON.parse(localStorage.getItem("allStoresListStorage"));
    var displayStoresList = JSON.parse(localStorage.getItem("displayStoresListStorage"));
    var wifiCondition = JSON.parse(localStorage.getItem("wifiCondition"));
    var socketCondition = JSON.parse(localStorage.getItem("socketCondition"));
    var smokingCondition = JSON.parse(localStorage.getItem("smokingCondition"));
    var searchWordCondition = JSON.parse(localStorage.getItem("searchWordCondition"));
    var distanceSortCondition = JSON.parse(localStorage.getItem("distanceSortCondition"));
    var displayStoresCount = localStorage.getItem("displayStoresCount");
    this.onWifi = wifiCondition
    this.onSocket = socketCondition
    this.onSmoking= smokingCondition
    this.searchWord = searchWordCondition
    this.onDistanceSort = distanceSortCondition
    this.stores.length = displayStoresCount
    if(this.searchWord){
      $('label[for="area"]').addClass("active");
    }
    if(allStoresList){
      this.allStores = allStoresList
      this.refreshFilter();
    } else if(displayStoresList){
      this.loading_show();
      this.stores = displayStoresList
      this.stores.length = displayStoresCount
      this.mountFetchStores();
    } else {
      this.fetchStores();
    }
  },
  computed: {
    displayStores: function(){
      return this.stores.slice(0,this.size)
    },
  },
  methods: {
    fetchStores: function(){
      axios.get('/api/stores').then((response)=>{
        for(var i = 0; i < response.data.stores.length; i++){
          this.stores.push(response.data.stores[i]);
        }
        this.allStores = this.stores
        this.refreshDistanceCalc();
      },(error) =>{
        alert('Sory');
      });
    },
    mountFetchStores: function(){
      axios.get('/api/stores').then((response)=>{
        var storesList = []
        for(var i = 0; i < response.data.stores.length; i++){
          storesList.push(response.data.stores[i]);
        }
        this.allStores = storesList
        this.mountDistanceCalc();
      },(error) =>{
        alert('Sory');
      });
    },
    mountDistanceCalc: function(){
      this.herePosition(this).then(function (value) {
        var hereLat = value[0];
        var hereLng = value[1];
        var that = value[2];
        that.allStores.forEach(function(store,i){
          var lat2 = store["lat"]
          var lng2 = store["lng"]
          var distance = that.getDistance(hereLat,hereLng,lat2,lng2,0)
          store.distance = distance
        })
        that.distanceSort();
        that.loading_hide();
        that.saveStorageStore();
      })
    },
    isPc: function(){
      if(!navigator.userAgent.match(/(iPhone|iPad|iPod|Android)/)){
        this.pc = true
      }else{
        this.pc = false
      }
    },
    socketFilter: function(){
      this.onSocket = !this.onSocket
      this.refreshFilter();
      this.get_moreread_desp();
    },
    wifiFilter: function(){
      this.onWifi = !this.onWifi
      this.refreshFilter();
      this.get_moreread_desp();
    },
    smokingFilter: function(){
      this.onSmoking= !this.onSmoking
      this.refreshFilter();
      this.get_moreread_desp();
    },
    refreshFilter: function(){
      var search_stores = this.wordListupStores();
      this.stores = this.filterListupStores(search_stores);
      this.get_moreread_desp();
    },
    filterListupStores: function(search_stores){
      var stores_list =[];
      var wifi    = this.onWifi
      var socket  = this.onSocket
      var smoking = this.onSmoking
      stores_list = search_stores.filter(function(value){
        var wifiList = wifi ? value.wifi : value.wifi + !value.wifi
        var socketList = socket ? value.socket: value.socket+ !value.socket
        var smokingList = smoking ? value.smoking : value.smoking + !value.smoking
        return (wifiList) && (socketList) && (smokingList)
      });
      return stores_list
    },
    searchStores: function(){
      var search_stores = this.wordListupStores();
      this.stores = this.filterListupStores(search_stores);
      $('#area').blur();
      this.get_moreread_desp();
      this.size = 10
    },
    wordListupStores: function(){
      var searchWord = this.searchWord && this.searchWord.toLowerCase();
      if(!searchWord){
        this.onDistanceSort = true
        return this.stores = this.allStores
      }
      this.onDistanceSort = false
      if(this.allStores){
      var stores_list = this.allStores.filter(function(value){
        return Object.keys(value).some(function(key){
          if(key === 'name' || key === "city" || key === "other_address" || key === "access"){
            return String(value[key]).toLowerCase().indexOf(searchWord) > -1
          }
        })
      })
      return stores_list
      }else{
        this.fetchStores();
      }
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
    moreread (){
      this.size += 10
      this.get_moreread_desp();
    },
    get_moreread_desp (){
      if(this.displayStores.length >= this.stores.length || this.stores.length <= 10){
        return this.moreread_desp = false
      }
      return this.moreread_desp = true
    },
    refreshDistanceCalc: function(){
      this.loading_show();
      this.herePosition(this).then(function (value) {
        var hereLat = value[0];
        var hereLng = value[1];
        var that = value[2];
        that.allStores.forEach(function(store,i){
          var lat2 = store["lat"]
          var lng2 = store["lng"]
          var distance = that.getDistance(hereLat,hereLng,lat2,lng2,0)
          store.distance = distance
        })
        that.searchWord = ''
        that.distanceSort()
        that.loading_hide();
        that.onDistanceSort = true
        that.saveStorageStore();
      })
    },
    herePosition: function(that){
      return new Promise((resolve,reject)=>{
        navigator.geolocation.getCurrentPosition(
          function (position) {
            var herePos = [position.coords.latitude,position.coords.longitude,that]
            resolve(herePos);
          },
          function(error) {
            alert("現在地を取得できません");
            $('.loading').hide();
            that.saveStorageStore();
          }
        );
      });
    },
    getDistance: function(lat1,lng1,lat2,lng2,precision){
      var distance = 0;
      if ((Math.abs(lat1 - lat2) < 0.00001) && (Math.abs(lng1 - lng2) < 0.00001)) {
        distance = 0;
      } else {
        lat1 = lat1 * Math.PI / 180;
        lng1 = lng1 * Math.PI / 180;
        lat2 = lat2 * Math.PI / 180;
        lng2 = lng2 * Math.PI / 180;
        var A = 6378140;
        var B = 6356755;
        var F = (A - B) / A;
        var P1 = Math.atan((B / A) * Math.tan(lat1));
        var P2 = Math.atan((B / A) * Math.tan(lat2));
        var X = Math.acos(Math.sin(P1) * Math.sin(P2) + Math.cos(P1) * Math.cos(P2) * Math.cos(lng1 - lng2));
        var L = (F / 8) * ((Math.sin(X) - X) * Math.pow((Math.sin(P1) + Math.sin(P2)), 2) / Math.pow(Math.cos(X / 2), 2) - (Math.sin(X) - X) * Math.pow(Math.sin(P1) - Math.sin(P2), 2) / Math.pow(Math.sin(X), 2));
        distance = A * (X + L);
        var decimal_no = Math.pow(10, precision);
        distance = Math.round(decimal_no * distance / 1) / decimal_no;   // kmに変換するときは(1000で割る)
        distance = Math.round(distance/10)*10
      }
      return distance;
    },
    distanceSort: function(){
      var storesList = []
      storesList = this.allStores.sort(function(a, b) {
        return (a.distance < b.distance) ? -1 : 1;
      });
      this.stores = storesList
      this.refreshFilter();
    },
    saveStorageStore: function(){
      localStorage.setItem('allStoresListStorage', JSON.stringify(this.allStores));
    },
    saveStorageCondition: function(){
      localStorage.setItem('socketCondition', JSON.stringify(this.onSocket));
      localStorage.setItem('wifiCondition', JSON.stringify(this.onWifi));
      localStorage.setItem('smokingCondition', JSON.stringify(this.onSmoking));
      localStorage.setItem('distanceSortCondition', JSON.stringify(this.onDistanceSort));
      localStorage.setItem('searchWordCondition', JSON.stringify(this.searchWord));
      localStorage.setItem('displayStoresListStorage', JSON.stringify(this.displayStores));
      localStorage.setItem('displayStoresCount', this.stores.length);
    },
    modal_open: function(store){
      this.$modal.show(pickStoreComponent, {
        pickStore: store
      },{
        width: "100%",
        height: "auto",
        pivotY: 0.9,
        scrollable: true,
        clickToClose: true,
      })
    },
    modal_close: function(){
      this.$modal.hide(pickStoreComponent);
    },
    loading_show: function(){
      $("#loading_anime").show();
      $("#stores_array").hide();
      $(".moreread").hide();
    },
    loading_hide: function(){
      $("#loading_anime").fadeOut();
      $("#stores_array").fadeIn();
      $(".moreread").fadeIn();
    },
  },
  filters: {
    access_cut: function(data){
      if(!data){
        return data
      }
      if(data.match(/.+?[0-9]分|.+?[0-9]km/)){
        return data.substr(0,data.search("[0-9]分|km")+2);
      }
      return data
    },
    km_convert: function(data){
      if(data >= 1000){
        data = Math.round(data /100)*100
        return (data / 1000) + "km"
      }else{
        return data+ "m"
      }
    }
  }
};
</script>
