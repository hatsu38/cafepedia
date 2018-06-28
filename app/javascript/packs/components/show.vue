<template>
  <div>
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

