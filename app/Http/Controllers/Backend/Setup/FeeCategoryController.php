<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use App\Models\FeeCategory;
use Illuminate\Http\Request;

class FeeCategoryController extends Controller
{
    //
    public function ViewFee() {
        $data['allData'] = FeeCategory::all();
        return view('backend.setup.fee_category.view_fee', $data);
    }
     public function AddFee(){
        return view('backend.setup.fee_category.add_fee');
    }
    public function StoreFee(Request $request){

        $validateData = $request->validate([
            'name' => 'required|unique:fee_categories,name',
        ]);

        $data = new FeeCategory();
        $data->name = $request->name;
        $data->save();

        $notification = array(
            'message' => 'Fee Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('fee.category.view')->with($notification);
    }

     public function EditFee($id){
        $editData = FeeCategory::find($id);
        return view('backend.setup.fee_category.edit_fee', compact('editData'));
    }

    public function UpdateFee(Request $request, $id){

        $data = FeeCategory::find($id);

        $validateData = $request->validate([
            'name' => 'required|unique:fee_categories,name,'. $data->id,
        ]);

        $data->name = $request->name;
        $data->save();

        $notification = array(
            'message' => 'Fee Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('fee.category.view')->with($notification);
    }

    public function DeleteFee($id){
        $user = FeeCategory::find($id);
        $user->delete();

         $notification = array(
            'message' => 'Fee Deleted',
            'alert-type' => 'info'
        );

        return redirect()->route('fee.category.view')->with($notification);
    }
}
