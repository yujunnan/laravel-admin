<template>
    <div class="form-group">
        <label for="picture">上传一张图片</label>
        <input type="file" class="form-control-file" id="picture" ref="picture" v-on:change="uploadFile"/>
        <input type="hidden" id="picture-path" value="">
        <div id="picture-preview">

        </div>
    </div>
</template>

<script>
import { ROAST_CONFIG } from '../../config.js';
    export default {
        methods: {
            uploadFile() { //上传附件
                let formData = new FormData();
                formData.append('picture', this.$refs.picture.files[0]);

                axios.post(
                   ROAST_CONFIG.API_URL + 'api/form/file_upload',
                    formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    }
                ).then(function (response) {
                    console.log(response);
                    $('#picture-path').val(response.data.path);
                    $('#picture-preview').html('<img src="' + response.data.path + '" height="100px">')
                }).catch(function (error) {
                    console.log(error);
                });
            },



        }
    }
</script>