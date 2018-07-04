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
      var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: this.store.lat, lng: this.store.lng},
        zoom: 14
      });
    }
  }
}
</script>

