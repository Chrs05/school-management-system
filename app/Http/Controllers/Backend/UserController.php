<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class UserController extends Controller
{
    //
    public function UserView() {
        // $allUsers = User::all();
        // return view('backend.user.view_user', compact('allUsers'));
        //OR
        $data['allUsers'] = User::all();
        return view('backend.user.view_user', $data);
    }

    public function AddUser() {
        return view('backend.user.add_user');
    }  

    public function StoreUser(Request $request) {

        $validatedData = $request->validate([
            'email' => 'required|unique:users',
            'name'  => 'required',
        ]);

        $data = new User();
        $data->usertype = $request->usertype;
        $data->name     = $request->name;
        $data->email    = $request->email;
        $data->password = bcrypt($request->password);
        $data->save();

        $notification = array(
            'message'    => 'User Created Successfully',
            'alert-type' => 'success'
        );

        return Redirect()->route('user.view')->with($notification);
    }

    public function EditUser($id) { 
        $editData = User::find($id);
        return view('backend.user.edit_user', compact('editData'));

    }

    public function UpdateUser(Request $request, $id) 
    { 
        
        $data = User::find($id);
        $data->usertype = $request->usertype;
        $data->name     = $request->name;
        $data->email    = $request->email;
        $data->save();
        
        $notification = array(
            'message'    => 'User Updated Successfully',
            'alert-type' => 'info'
        );
        
        return Redirect()->route('user.view')->with($notification);
        
    }
    
    public function DeleteUser($id) {
          
        $data = User::find($id);
        $data->delete();
        
        $notification = array(
            'message'    => 'User Deleted Successfully',
            'alert-type' => 'warning'
        );
        
        return Redirect()->route('user.view')->with($notification);
    }
}


// Swal.fire({
//     title: 'Are you sure?',
//     text: "You won't be able to revert this!",
//     icon: 'warning',
//     showCancelButton: true,
//     confirmButtonColor: '#3085d6',
//     cancelButtonColor: '#d33',
//     confirmButtonText: 'Yes, delete it!'
//   }).then((result) => {
//     if (result.isConfirmed) {
//       Swal.fire(
//         'Deleted!',
//         'Your file has been deleted.',
//         'success'
//       )
//     }
//   })
