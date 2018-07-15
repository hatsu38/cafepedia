<template>
  <!-- <modal name="pickStoreComponent"> -->
  <div id="store_detail">
      <!-- <div @click="modal_close">閉じる</div> -->
    <h2>{{pickStore.name}}</h2>
    <table class="table">
      <tbody>
        <tr>
          <th><i class="fas fa-clock"></i></th>
          <td>
            <pre>{{pickStore.business_hour}}</pre>
          </td>
        </tr>
        <tr>
          <th><i class="fas fa-train"></i></th>
          <td>
            {{pickStore.access}}
          </td>
        </tr>
        <tr>
          <th><i class="fas fa-map-marker-alt"></i></th>
          <td>
            {{pickStore.prefecture}}{{pickStore.city}}{{pickStore.other_address}}
          </td>
        </tr>
        <tr>
          <th><i class="fas fa-phone"></i></th>
          <td>
            {{pickStore.tel}}
          </td>
        </tr>
        <tr>
          <th>HP</th>
          <td>
            <a :href="pickStore.hp" target="_blank">公式HP</a>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="icons_box">
      <i class="fas fa-smoking" v-show="pickStore.smoking"></i>
      <i class="fas fa-wifi" v-show="pickStore.wifi"></i>
      <i class="fas fa-plug" v-show="pickStore.socket"></i>
      <div class="iccard_img_block" v-show="pickStore.iccard">
        <img src="/uploads/iccard_service.jpg" class="iccard_icon">
      </div>
    </div>
    <div id='map'></div>
  </div>
  <!-- </modal> -->
</template>
<script>
import axios from 'axios';
export default {
  props: ['pickStore'],
  // created: function(){
  //   this.gmapCteate();
  // },
  methods: {
    modal_close: function(){
      // this.$modal.hide('pickStoreComponent');
      this.$modal.hide('modals-container');
    }
  //   gmapCreate: function(){
  //     var store_lat = parseFloat(this.store.lat);
  //     var store_lng = parseFloat(this.store.lng);
  //     var map = new google.maps.Map(document.getElementById('map'), { // #sampleに地図を埋め込む
  //       center: { // 地図の中心を指定
  //         lat: store_lat, // 緯度
  //         lng: store_lng// 経度
  //       },
  //       zoom: 14 // 地図のズームを指定
  //     });
  //     this.gmarkerDesp(store_lat,store_lng,map);
  //   },
  //   gmarkerDesp: function(lat,lng,map){
  //     var marker = new google.maps.Marker({
  //       // マーカーを置く緯度経度
  //       position: new google.maps.LatLng(lat,lng),
  //       map: map
  //     });
  //   }
  //
  }
}
</script>
