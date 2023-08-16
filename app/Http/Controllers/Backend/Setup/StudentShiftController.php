<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\StudentShift;


class StudentShiftController extends Controller
{
    //
     public function ViewStudentShift(){
        $data['allData'] = StudentShift::all();
        return view('backend.setup.student_shifts.view_shift', $data);
    }
    public function AddStudentShift(){
        return view('backend.setup.student_shifts.add_shift');
    }
    public function StoreStudentShift(Request $request){

        $validateData = $request->validate([
            'name' => 'required|unique:student_shifts,name',
        ]);

        $data = new StudentShift();
        $data->name = $request->name;
        $data->save();

        $notification = array(
            'message' => 'Student Shift Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('student.shift.view')->with($notification);
    }

     public function EditStudentShift($id){
        $editData = StudentShift::find($id);
        return view('backend.setup.student_shifts.edit_shift', compact('editData'));
    }

    public function UpdateStudentShift(Request $request, $id){

        $data = StudentShift::find($id);

        $validateData = $request->validate([
            'name' => 'required|unique:student_shifts,name,'. $data->id,
        ]);

        $data->name = $request->name;
        $data->save();

        $notification = array(
            'message' => 'Student Shift Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('student.shift.view')->with($notification);
    }

    public function DeleteStudentShift($id){
        $user = StudentShift::find($id);
        $user->delete();

         $notification = array(
            'message' => 'Student Shift Deleted',
            'alert-type' => 'info'
        );

        return redirect()->route('student.shift.view')->with($notification);
    }
}
