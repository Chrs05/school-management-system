@extends('admin.admin_master')
@section('admin')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <div class="container-full">

    <section class="content">

        <!-- Basic Forms -->
         <div class="box">
           <div class="box-header with-border">
             <h4 class="box-title">Add Student Shift</h4>
             <h6 class="box-subtitle">Bootstrap Form Validation check the <a class="text-warning" href="http://reactiveraven.github.io/jqBootstrapValidation/">official website </a></h6>
           </div>
           <!-- /.box-header -->
           <div class="box-body">
             <div class="row">
               <div class="col">

                   <form action="{{ route('student.shift.store') }}" method="POST">
                    @csrf

                     <div class="row">
                       <div class="col-12">


                        <div class="row">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <h5>Student Shift Name <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="name" id="name" class="form-control">
                                        @error('name')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>

                                </div>
                            </div>

                        </div>

                       </div>
                     </div>

                       <input type="submit" value="Add Student Shift" class="btn btn-rounded btn-info">
                   </form>

               </div>
               <!-- /.col -->
             </div>
             <!-- /.row -->
           </div>
           <!-- /.box-body -->
         </div>
         <!-- /.box -->

       </section>

  </div>
</div>
<!-- /.content-wrapper -->
@endsection
