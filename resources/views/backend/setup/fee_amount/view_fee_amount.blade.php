@extends('admin.admin_master')
@section('admin')


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <div class="container-full">

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Fee Amount List</h3>

              <a class="btn btn-rounded btn-success mb-5 float-right" href="{{route('fee.amount.add')}}">Add Fee Amount</a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <div id="example1_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                  <div class="row">
                    <div class="col-sm-12">
                      <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                        <thead>
                          <tr role="row">
                            <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 15px;">ID</th>

                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 81.7188px;">Fee Category</th>

                            <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 150px;">Action</th>

                          </tr>

                        </thead>
                        <tbody>

                          @foreach ($allData as $key => $amount)
                            <tr role="row" class="odd">
                              <td>{{ $key+1 }}</td>

                              <td> {{ $amount['fee_cateogry']['name'] }}</td>
                              <td>
                                <a href="{{ route('fee.amount.edit', $amount->fee_category_id) }}" class="btn btn-info">Edit Fee</a>
                                <a href="{{ route('fee.amount.details', $amount->fee_category_id) }}" id="detail" class="btn btn-success">Details</a>
                              </td>
                            </tr>
                          @endforeach

                        </tbody>
                        <tfoot>
                          <tr>
                            <th rowspan="1" colspan="1">ID</th>
                            <th rowspan="1" colspan="1">Fee Category</th>
                            <th rowspan="1" colspan="1">Action</th>
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
</div>
<!-- /.content-wrapper -->
@endsection
