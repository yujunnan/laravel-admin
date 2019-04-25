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

<div class="container">
    <!--容器-->
    <div class="row ">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading"><h3>电影</h3></div>
                <div class="panel-body"  v-for="item in movies">
                    <div class="col-md-2">
                        <a :href="getMoviehref(item.id)"><img src="/storage/images/75df72ed1747208c8130af6c12d8ea84.jpg" width="100%"></a>
                    </div>
                    <div class="col-md-10">
                        <p class='title'><a :href="getMoviehref(item.id)">{{item.name}}</a></p>
                        <p class='content'>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                    </div>
                </div>





            </div>
        </div>
    </div>
</div>


</div>
</template>

<script>
import { ROAST_CONFIG } from '../config.js';

    export default {
        data() {
           return {
                movies:[],
                page:0,
                limit:10,
                scrollTop:0,//滚动条位置
                offsetHeight:0,//可视区高
                scrollHeight:0,//滚动区域
                noMoreData: true, //是否有更多数据
               
           }
        },
        //钩子函数
        created() {
            //this.url=ROAST_CONFIG.API_URL+'movies/getmovie/';
             window.addEventListener('scroll', this.onScroll);
             this.getMoreData();

        },
        /**
         * 事件处理
         */        
        methods: {
                getMoviehref(id){

                    return  ROAST_CONFIG.API_URL+'movies/getmovie#movie?id='+id;
                },
                onScroll() {

                    //可滚动容器的高度
                    let innerHeight = document.querySelector('#app').clientHeight;
                    //屏幕尺寸高度
                    let outerHeight = document.documentElement.clientHeight;
                    //可滚动容器超出当前窗口显示范围的高度
                    let scrollTop = document.documentElement.scrollTop;
                    //scrollTop在页面为滚动时为0，开始滚动后，慢慢增加，滚动到页面底部时，出现innerHeight < (outerHeight + scrollTop)的情况，严格来讲，是接近底部。
                    //console.log(innerHeight + " " + outerHeight + " " + scrollTop);
                     
                    if (innerHeight < (outerHeight + scrollTop+100) &&this.noMoreData==true) {
                        this.noMoreData=false;
                        this.getMoreData();
                    }
                },

            getMoreData(){
               
                var self = this;
                var list= this.movies;
                var url=ROAST_CONFIG.API_URL + 'movies/getmovies';
                var params = new URLSearchParams();
                params.append('page',this.page);
                params.append('limit', this.limit);
                axios.post(url, params).then(function (response) {
                    if(response.data.length!=0){
                        self.page+=1;
                        
                        self.movies=list.concat(response.data.movies);
                         self.noMoreData=true;
                        
                    }else{

                        self.noMoreData=false;
                    }
                }).catch(function (error) {
                　　  self.noMoreData=false;
                });




            }




        }
        
    }

    //添加滚动事件
  




</script>