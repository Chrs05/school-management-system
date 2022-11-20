@extends('admin.admin_master') 
@section('admin')

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <div class="container-full">
  
    <section class="content">

        <!-- Basic Forms -->
         <div class="box">
           <div class="box-header with-border">
             <h4 class="box-title">Manage Profile </h4>
             <h6 class="box-subtitle">Bootstrap Form Validation check the <a class="text-warning" href="http://reactiveraven.github.io/jqBootstrapValidation/">official website </a></h6>
           </div>
           <!-- /.box-header -->
           <div class="box-body">
             <div class="row">
               <div class="col">

                   <form action="{{ route('profile.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                     <div class="row">
                       <div class="col-12">	

                        <div class="row">
                   
                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Username <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="name" class="form-control" value="{{ $editData->name }}"> 
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Email <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="email" class="form-control" value="{{ $editData->email }}"> 
                                    </div>

                                </div>
                            </div>
                        </div>
                        {{-- end row --}}        
                        
                        <div class="row">
                      
                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Phone <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="mobile" class="form-control" value="{{ $editData->mobile }}"> 
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Address <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="text" name="address" class="form-control" value="{{ $editData->address }}"> 
                                    </div>

                                </div>
                            </div>
                        </div>
                        {{-- end row --}}

                       
                        <div class="row">


                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Gender <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <select name="gender" id="gender" class="form-control">
                                            <option value="" selected="" disabled>Select Gender</option>
                                            <option value="Male" {{ $editData->usertype == "Admin" ? "selected" : "" }}>Male</option>
                                            <option value="Female" {{ $editData->usertype == "User" ? "selected" : "" }}>Female</option>
                                        </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <h5>Profile Image <span class="text-danger">*</span></h5>
                                    <div class="controls">
                                        <input type="file" id="image" name="image" class="form-control"> 
                                    </div>
                                </div>
                            </div>

                        </div>

                        {{-- <div class="row"></div> --}}
                            {{-- <div class="col-md-6 separator"></div> --}}

                            <div class="col-md-6">
                                <div class="form-group">
                                  <img style="margin:0 auto;display:table;" id="show_image" src="{{ (!empty($user->image)) ? url('upload/profile_images/'. $user->image) :url('upload/no_image.jpg') }}" alt="">
                                </div>
                            </div>

                        

                        </div>

                       </div>
                     </div>
                      
                       <input type="submit" value="Update" class="btn btn-rounded btn-info">
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

<script type="text/javascript">
   $(document).ready(function() {
    $('#image').change(function(e){
        var reader = new FileReader();
        reader.onload = function(e){
            $('#show_image').attr('src', e.target.result);
        }
        reader.readAsDataURL(e.target.files['0']);
    });
   }); 
</script>


@endsection