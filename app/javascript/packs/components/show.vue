<template>
  <div>
    <header class="center white-text" id="top_header">
      <router-link to="/" class="white-text">
        <i class="fas fa-smoking"></i>
        <h1 class="logo">喫煙カフェ</h1>
      </router-link>
    </header>
    <h2>{{store.name}}</h2>
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
  mounted: function(){
      this.gmapdesp();
  },
  methods: {
    fetchStoreDetail: function(){
      var id = this.$route.params.id;
      axios.get('/api/stores/'+id).then((response)=>{
        this.store = response.data.store;
      },(error)=>{
        alart("Sorry");
      });
    },
    gmapcreate: function(){
        console.log(this.store);
        var mapOptions = {"center":{"lat": parseFloat(this.store.lat),"lng": parseFloat(this.store.lng)},"mapTypeId": "roadmap","zoom": 15};
        var mapElement = document.getElementById('map');
        var map = new google.maps.Map(mapElement, mapOptions);
        google.maps.event.addDomListener(window, "resize", function() { var center = map.getCenter(); google.maps.event.trigger(map, "resize"); map.setCenter(center); });
    },
    gmapdesp: function(){
      google.maps.event.addDomListener(window, 'load', this.gmapcreate);
    }
  }
}
</script>

