<form action="create" method="post" enctype="multipart/form-data">

    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">

                <div class="form-horizontal">
                    <div class="box-body">
                        {!!$html->name!!}
                        {!!$html->price!!}
                        {!!$html->sort!!}                        
                        {!!$html->thumbnail!!}
                        




                        {!!$html->content!!}
                        {!!$html->status!!}
                        {!!$html->product_category_id!!}

                        <H3 class="text-center">各渠道售价<font class="text-danger">(各渠道售价必填)</font></H3>

                        @foreach($roles as $key=> $item)
                        <div class='form-group  {!! !$errors->has("prices.$key.product_price") ? '' : 'has-error' !!} '>
                                      
                            <label for="$item->id" class="col-sm-2  control-label">
                                {{ $item->role->name }}
                              
                                
                            </label>

                            <div class="col-sm-8">
                                         @foreach ($errors->get("prices.$key.product_price") as $error)
                                            <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{$error}}</label><br/>
                                        @endforeach
                                
                                <div class="input-group">
                                    <span class="input-group-addon">￥</span>
                                    <input  style="width: 120px" type="text"  value='{{ $item->product_price }}' class="form-control" placeholder="输入 参考价" disabled />
     
                                </div>

                                
                            </div>
                        </div>

                        @endforeach




    



                    </div>
                </div>
            </div>
        </div>
    </div>


</form>