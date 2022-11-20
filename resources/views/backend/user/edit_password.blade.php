@extends('admin.admin_master') 
@section('admin')


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <div class="container-full">
  
    <section class="content">

        <!-- Basic Forms -->
         <div class="box">
           <div class="box-header with-border">
             <h4 class="box-title">Change Password</h4>
             <h6 class="box-subtitle">Bootstrap Form Validation check the <a class="text-warning" href="http://reactiveraven.github.io/jqBootstrapValidation/">official website </a></h6>
           </div>
           <!-- /.box-header -->
           <div class="box-body">
             <div class="row">
               <div class="col">

                   <form action="{{ route('password.change') }}" method="POST">
                    @csrf

                     <div class="row">
                       <div class="col-12">	

                      
                        <div class="row">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <h5>Current Password <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="password" name="oldpassword" id="current_password" class="form-control"> 
                                    </div>
                                    {{-- @error('oldpassword')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror --}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <h5>New Password <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="password" name="password" id="password" class="form-control"> 
                                    </div>
                                {{-- @error('password')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror --}}
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <h5>Confirm Password <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="password" name="password_confirmation" id="password_confirmation" class="form-control"> 
                                    </div>
                                {{-- @error('password_confirmation')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror --}}
                                </div>
                            </div>

                        </div>

                       </div>
                     </div>
                      
                       <input type="submit" value="Update Password" class="btn btn-rounded btn-info">
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