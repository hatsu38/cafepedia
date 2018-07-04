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
            <a :href="store.tel" target="_blank">公式HP</a>
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

    <div id='result'></div>
    <div id='map'></div>
  </div>
</template>
</script>
<script>
// var lat1 = 36.2939226;
// var lng1 = 139.691706
// var lat2 = 35.689487;
// var lng2 = 139.691706;
//
// //距離の計算//
// function getDistance(lat1, lng1, lat2, lng2) {
//
//   function radians(deg){
//     return deg * Math.PI / 180;
//   }
//
//   return 6378.14 * Math.acos(Math.cos(radians(lat1))* 
//     Math.cos(radians(lat2))*
//     Math.cos(radians(lng2)-radians(lng1))+
//     Math.sin(radians(lat1))*
//     Math.sin(radians(lat2)));
// }
// #<{(|結果|)}>#
// alert(getDistance(lat1,lng1,lat2,lng2));
import axios from 'axios';
export default {
  data: function(){
    return {
      store: []
    }
  },
  created: function(){
    this.fetchStoreDetail();
    var lat1 = 36.2939226;
    var lng1 = 139.691706;
    var lat2 = 35.689487;
    var lng2 = 139.691706;
    this.getDistance(lat1,lng1,lat2,lng2,0);
  },
  methods: {
    fetchStoreDetail: function(){
      var id = this.$route.params.id;
      axios.get('/api/stores/'+id).then((response)=>{
        this.store = response.data.store;
        this.gmapcreate();
      },(error)=>{
        alart("Sorry");
      });
    },
  }
}
</script>

