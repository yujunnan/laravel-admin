<style lang="scss">
div#movies{
    
    p.title{
       line-height:30px;
       padding-top:10px 0px;
    }
    


}

</style>

<template>
<div id="movies">


</div>
</template>

<script>
import { ROAST_CONFIG } from '../config.js';

    export default {
        data() {
           return {

               
           }
        },
        //钩子函数
        created() {
            console.log(this.$route.query.id);

        },
        /**
         * 事件处理
         */        
        methods: {
               

         




        }
        
    }

    //添加滚动事件
  




</script>