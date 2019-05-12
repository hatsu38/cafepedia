<template>
  <div id="store_detail">
    <header class="white-text" id="top_header">
      <div  data-target="slide-out" class="sidenav-trigger menu">
        <i class="fas fa-bars"></i>
      </div>
      <router-link to="/" class="white-text center site-name">
        <i class="fas fa-coffee"></i>
        <h1 class="logo">カフェペディア</h1>
      </router-link>
    </header>
    <div class="container">
    <h2>{{store.name}}</h2>
    <table class="table">
      <tbody>
        <tr>
          <th><i class="fas fa-clock"></i></th>
          <td>
            <pre>{{store.business_hour}}</pre>
          </td>
        </tr>
        <tr>
          <th><i class="fas fa-train"></i></th>
          <td>
            {{store.access}}
          </td>
        </tr>
        <tr>
          <th><i class="fas fa-map-marker-alt"></i></th>
          <td>
            {{store.prefecture}}{{store.city}}{{store.other_address}}
          </td>
        </tr>
        <tr v-show="store.chair">
          <th><i class="fas fa-store-alt"></i></th>
          <td class="chair_volume">
            {{store.chair}}
          </td>
        </tr>
        <tr>
          <th><i class="fas fa-phone"></i></th>
          <td>
            {{store.tel}}
          </td>
        </tr>
        <tr>
          <th>HP</th>
          <td>
            <a :href="store.hp" target="_blank">公式HP</a>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="icons_box">
      <i class="fas fa-smoking" v-show="store.smoking"></i>
      <i class="fas fa-wifi" v-show="store.wifi"></i>
      <i class="fas fa-plug" v-show="store.socket"></i>
      <div class="iccard_img_block" v-show="store.iccard">
        <img src="/uploads/iccard_service.jpg" class="iccard_icon">
      </div>
    </div>
    <div class="map_block">
      <div id='map'></div>
      <a href="" id="to_map_app" target="_blank">地図アプリで見る</a>
    </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  data: function(){
    return {
      store: []
    }
  },
  created: function(){
    this.fetchStoreDetail();
    this.toMapAppHrefCreate();
  },
  methods: {
    fetchStoreDetail: function(){
      var id = this.$route.params.id;
      axios.get('/api/stores/'+id).then((response)=>{
        this.store = response.data.store;
        this.gmapCreate();
      },(error)=>{
        alert("Sorry");
      });
    },
    gmapCreate: function(){
      var store_lat = parseFloat(this.store.lat);
      var store_lng = parseFloat(this.store.lng);
      var map = new google.maps.Map(document.getElementById('map'), { // #sampleに地図を埋め込む
        center: { // 地図の中心を指定
          lat: store_lat, // 緯度
          lng: store_lng// 経度
        },
        zoom: 14, // 地図のズームを指定
        mapTypeControl: false,
        streetViewControl: false,
      });
      this.gmarkerDesp(store_lat,store_lng,map);
    },
    gmarkerDesp: function(lat,lng,map){
      var marker = new google.maps.Marker({
        // マーカーを置く緯度経度
        position: new google.maps.LatLng(lat,lng),
        map: map
      });
    },
    toMapAppHrefCreate: function(){
      var agent = navigator.userAgent;
      var store_lat = parseFloat(this.store.lat);
      var store_lng = parseFloat(this.store.lng);
      var store_address = this.store.prefecture+this.store.city+this.store.other_address;
      $("#to_map_app").attr("href", `http://maps.google.com/maps?saddr=現在地&daddr=${store_address}&dirflg=r&z=14`);
    }
  }
}
</script>

