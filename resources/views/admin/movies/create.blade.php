<form action="/adminyc/area" method="post">

    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">创建公司</h3>
                </div>
                <div class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group  {!! !$errors->has('name') ? '' : 'has-error' !!}">
                            <label for="text1" class="col-sm-2 control-label">公司名称</label>
                            <div class="col-sm-10">
                                @foreach ($errors->get('name') as $error)
                                    <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{$error}}</label><br/>
                                @endforeach
                                <input type="text" class="form-control" id="text1" placeholder="公司名称" name="name" value="{{old('name', $name)}}">
                            </div>
                        </div>
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