<template>
  <div id="store_detail">
    <header class="center white-text" id="top_header">
      <router-link to="/" class="white-text">
        <i class="fas fa-smoking"></i>
        <h1 class="logo">喫煙カフェ</h1>
      </router-link>
    </header>
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
    <div id='map'></div>
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
  },
  methods: {
    fetchStoreDetail: function(){
      var id = this.$route.params.id;
      axios.get('/api/stores/'+id).then((response)=>{
        this.store = response.data.store;
        this.gmapCreate();
      },(error)=>{
        alart("Sorry");
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
        zoom: 14 // 地図のズームを指定
      });
      this.gmarkerDesp(store_lat,store_lng,map);
    },
    gmarkerDesp: function(lat,lng,map){
      var marker = new google.maps.Marker({
        // マーカーを置く緯度経度
        position: new google.maps.LatLng(lat,lng),
        map: map
      });
    }
  }
}
</script>

