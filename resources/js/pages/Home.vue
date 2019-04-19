<style>

</style>

<template>

    <div id="home">
        {{ message }} 点击次数 {{ click_num }}

        <button type="button" v-on:click="click_me(111)">点击我</button>

    </div>
</template>

<script>
    export default {
        data() {
           return {
               message: '加载中',
               click_num:0
           }
        },
        components: {
        },
        //钩子函数
        created() {
          this.message="加载完成";

        },
        /**
         * 定义组件的计算属性
         */
        computed: {
         
        },
        /**
         * 事件处理
         */        
        methods:{
            click_me: function () {
                
            }



        }
        //

        
    }
</script>