<template>
  <div class="store" v-for="store in stores">
    <h2>{{ store.name }}</h2>
    <span>{{ store.acces s}}</span>
    <div class="row">
      <div class="col s5 mainstore_logo">
        {{store.mainstore.logo}}
      </div>
      <div class="col s7">
        <table class="table">
          <thead>
            <tr>
              <th>営業時間</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <p>{{store.weekday_start}}~{{store.weekday_finishday}}</p>
                <p>{{store.saturday_start}}~{{store.saturday_finishday}}</p>
                <p>{{store.sunday_start}}~{{store.sunday_finishday}}</p>
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
    </div>
  </div>
</template>

<script>
// import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios';


export default {
  data: function(){
    return {
      name: "hoge"
    }
  },
  // mounted: function(){
  //   this.fetchStores();
  // },
  // methods: {
  //   fetchStores: function(){
  //     axios.get('/api/stores').then((response) => {
  //       for(var i=1; i<response.data.stores.length; i++){
  //         this.stores.push(response.data.stores[i]);
  //       }
  //     },(error)=>{
  //       console.log(error);
  //     })
  //   }
  // }
}

</script>

