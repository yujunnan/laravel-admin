<form action="create" method="post">

    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">

                <div class="form-horizontal">
                    <div class="box-body">

                        {!!$name!!}
                        {!!$price!!}
                        {!!$sort!!}                        
                        {!!$thumbnail!!}
                        {!!$content!!}
                        {!!$status!!}
                        {!!$product_category_id!!}
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="box-footer">
        <button type="submit" class="btn btn-info pull-right">保存</button>
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
    </div>
</form>