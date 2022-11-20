@extends('admin.admin_master') 
@section('admin')


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <div class="container-full">
  
    <section class="content">

        <!-- Basic Forms -->
         <div class="box">
           <div class="box-header with-border">
             <h4 class="box-title">Add User</h4>
             <h6 class="box-subtitle">Bootstrap Form Validation check the <a class="text-warning" href="http://reactiveraven.github.io/jqBootstrapValidation/">official website </a></h6>
           </div>
           <!-- /.box-header -->
           <div class="box-body">
             <div class="row">
               <div class="col">

                   <form action="{{ route('store.user') }}" method="POST">
                    @csrf

                     <div class="row">
                       <div class="col-12">	

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>User Role <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <select name="usertype" id="select" required="" class="form-control">
                                            <option value="" selected="" disabled>Select User Role</option>
                                            <option value="Admin">Admin</option>
                                            <option value="User">User</option>
                                        </select>
                                    <div class="help-block"></div></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Username <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="name" class="form-control" > 
                                    </div>

                                </div>
                            </div>
                        </div>
                        {{-- end row --}}
                      
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Email <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="email" name="email" class="form-control"> 
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Password <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="password" name="password" class="form-control"> 
                                    </div>
                                </div>
                            </div>

                        </div>

                       </div>
                     </div>
                      
                       <input type="submit" value="Add User" class="btn btn-rounded btn-info">
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