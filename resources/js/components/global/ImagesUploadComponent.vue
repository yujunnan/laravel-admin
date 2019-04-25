<style>

</style>
<template>
<div id='images'>
    <div class="form-group">
        <label for="picture">上传一张图片</label>
        <input type="file" class="form-control-file" id="picture" ref="picture" v-on:change="uploadFile"  />
       <input type="hidden" id="picture-path" value="" name='url'>
        <div id="picture-preview">

        </div>
       


    </div>
     <div class="col-md-12 " v-if="!success">              
          <div class="alert alert-danger">
                <ul >
                    <li v-for="item in errors.picture">{{item}}</li>
                </ul>
            </div>
    </div>               
</div>     
</template>

<script>
import { ROAST_CONFIG } from '../../config.js';
    export default {
        data() {
           return {
                errors: [],
                success:true
           }
        },
        methods: {
            uploadFile() { 

              var self = this;             
                self.errors=[];
                //上传附件
                let formData = new FormData();
                formData.append('picture', this.$refs.picture.files[0]);

                axios.post(
                   ROAST_CONFIG.API_URL + 'api/form/images_upload',
                    formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    }
                ).then(function (response) {
                   //console.log(response.data.errors);
                    if(response.data.success==false){

                        self.errors=response.data.errors; 
                        self.success=response.data.success;
                        return false;
                    }
                    $('#picture-path').val(response.data.path);
                    $('#picture-preview').html('<img src="' + response.data.path + '" height="100px">')
                }).catch(function (error) {
  
                    alert(error);


                });
            },



        }
    }
</script>