<template>
  <div>
    <header class="center white-text" id="top_header">
      <router-link to="/" class="white-text">
        <i class="fas fa-smoking"></i>
        <h1 class="logo">喫煙カフェ</h1>
      </router-link>
    </header>
    <h2>{{store.name}}</h2>
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
  mounted: function(){
    this.fetchStoreDetail();
  },
  methods: {
    fetchStoreDetail: function(){
      var id = this.$route.params.id;
      axios.get('/api/stores/'+id).then((response)=>{
        this.store = response.data.store;
      },(error)=>{
        alart("Sorry");
      });
    }
  }
}
</script>

