<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Backend\ProfileController;
use App\Http\Controllers\Backend\Setup\AssignSubjectController;
use App\Http\Controllers\Backend\Setup\DesignationController;
use App\Http\Controllers\Backend\Setup\SchoolSubjectController;
use App\Http\Controllers\Backend\Setup\ExamTypeController;
use App\Http\Controllers\Backend\Setup\FeeAmountController;
use App\Http\Controllers\Backend\Setup\FeeCategoryController;
use App\Http\Controllers\Backend\Setup\StudentClassController;
use App\Http\Controllers\Backend\Setup\StudentYearController;
use App\Http\Controllers\Backend\Setup\StudentGroupController;
use App\Http\Controllers\Backend\Setup\StudentShiftController;

use App\Http\Controllers\Backend\Student\ExamFeeController;
use App\Http\Controllers\Backend\Student\MonthlyFeeController;
use App\Http\Controllers\Backend\Student\RegistrationFeeController;
use App\Http\Controllers\Backend\Student\StudentRegController;
use App\Http\Controllers\Backend\Student\StudentRoleController;

use App\Http\Controllers\Backend\Employee\EmployeeRegController;
use App\Http\Controllers\Backend\Employee\EmployeeSalaryController;
use App\Http\Controllers\Backend\Employee\EmployeeLeaveController;
use App\Http\Controllers\Backend\Employee\EmployeeAttendanceController;
use App\Http\Controllers\Backend\Employee\MonthlySalaryController;

use App\Http\Controllers\Backend\Marks\MarksController;
use App\Http\Controllers\Backend\Marks\GradeController;

use App\Http\Controllers\Backend\DefaultController;

use App\Http\Controllers\Backend\Account\StudentFeeController;
use App\Http\Controllers\Backend\Account\AccountSalaryController;
use App\Http\Controllers\Backend\Account\OtherCostController;

use App\Http\Controllers\Backend\Report\ProfiteController;
use App\Http\Controllers\Backend\Report\MarkSheetController;
use App\Http\Controllers\Backend\Report\AttenReportController;
use App\Http\Controllers\Backend\Report\ResultReportController;

use App\Http\Controllers\Backend\UserController;
use Illuminate\Support\Facades\Route;




/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Route::middleware([
    'auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {

    Route::get('/dashboard', function () {
        return view('admin.index');
    })->name('dashboard');

});

Route::get('/admin/logout', [AdminController::class, 'Logout'])->name('admin.logout');


Route::group(['middleware' => 'auth'],function(){

    //User Management Routes
    Route::prefix('users')->group(function () {
        Route::get('/view', [UserController::class, 'UserView'])->name('user.view');
        Route::get('/add', [UserController::class, 'AddUser'])->name('add.user');
        Route::post('/store', [UserController::class, 'StoreUser'])->name('store.user');
        Route::get('/edit/{id}', [UserController::class, 'EditUser'])->name('users.edit');
        Route::post('/update/{id}', [UserController::class, 'UpdateUser'])->name('users.update');
        Route::get('/delete/{id}', [UserController::class, 'DeleteUser'])->name('users.delete');
    });

    //User Profile
    Route::prefix('profile')->group(function () {

        Route::get('/view', [ProfileController::class, 'ProfileView'])->name('profile.view');
        Route::get('/edit', [ProfileController::class, 'ProfileEdit'])->name('profile.edit');
        Route::post('/store', [ProfileController::class, 'ProfileStore'])->name('profile.store');
        Route::get('/password/view', [ProfileController::class, 'PasswordView'])->name('password.view');
        Route::post('/password/update', [ProfileController::class, 'PasswordUpdate'])->name('password.change');

    });


    Route::prefix('setups')->group(function () {

        //Student Class Routes
        Route::get('/student/class/view', [StudentClassController::class, 'ViewStudent'])->name('student.class.view');
        Route::get('/student/class/add', [StudentClassController::class, 'AddStudentClass'])->name('student.class.add');
        Route::post('/student/class/store', [StudentClassController::class, 'StoreStudentClass'])->name('student.class.store');

        Route::get('/student/class/edit/{id}', [StudentClassController::class, 'EditStudentClass'])->name('student.class.edit');
        Route::post('/student/class/update/{id}', [StudentClassController::class, 'UpdateStudentClass'])->name('student.class.update');
        Route::get('/student/class/delete/{id}', [StudentClassController::class, 'DeleteStudentClass'])->name('student.class.delete');

        //Student Year Routes
        Route::get('/student/year/view', [StudentYearController::class, 'ViewStudentYear'])->name('student.year.view');
        Route::get('/student/year/add', [StudentYearController::class, 'AddStudentYear'])->name('student.year.add');
        Route::post('/student/year/store', [StudentYearController::class, 'StoreStudentYear'])->name('student.year.store');

        Route::get('/student/year/edit/{id}', [StudentYearController::class, 'EditStudentYear'])->name('student.year.edit');
        Route::post('/student/year/update/{id}', [StudentYearController::class, 'UpdateStudentYear'])->name('student.year.update');
        Route::get('/student/year/delete/{id}', [StudentYearController::class, 'DeleteStudentYear'])->name('student.year.delete');

        //Student Group Routes
        Route::get('/student/group/view', [StudentGroupController::class, 'ViewStudentGroup'])->name('student.group.view');
        Route::get('/student/group/add', [StudentGroupController::class, 'AddStudentGroup'])->name('student.group.add');
        Route::post('/student/group/store', [StudentGroupController::class, 'StoreStudentGroup'])->name('student.group.store');

        Route::get('/student/group/edit/{id}', [StudentGroupController::class, 'EditStudentGroup'])->name('student.group.edit');
        Route::post('/student/group/update/{id}', [StudentGroupController::class, 'UpdateStudentGroup'])->name('student.group.update');
        Route::get('/student/group/delete/{id}', [StudentGroupController::class, 'DeleteStudentGroup'])->name('student.group.delete');


        //Student Shift Routes
        Route::get('/student/shift/view', [StudentShiftController::class, 'ViewStudentShift'])->name('student.shift.view');
        Route::get('/student/shift/add', [StudentShiftController::class, 'AddStudentShift'])->name('student.shift.add');
        Route::post('/student/shift/store', [StudentShiftController::class, 'StoreStudentShift'])->name('student.shift.store');

        Route::get('/student/shift/edit/{id}', [StudentShiftController::class, 'EditStudentShift'])->name('student.shift.edit');
        Route::post('/student/shift/update/{id}', [StudentShiftController::class, 'UpdateStudentShift'])->name('student.shift.update');
        Route::get('/student/shift/delete/{id}', [StudentShiftController::class, 'DeleteStudentShift'])->name('student.shift.delete');


        //Student Fee Routes
        Route::get('/fee/category/view', [FeeCategoryController::class, 'ViewFee'])->name('fee.category.view');
        Route::get('/fee/category/add', [FeeCategoryController::class, 'AddFee'])->name('fee.category.add');
        Route::post('/fee/category/store', [FeeCategoryController::class, 'StoreFee'])->name('fee.category.store');

        Route::get('/fee/category/edit/{id}', [FeeCategoryController::class, 'EditFee'])->name('fee.category.edit');
        Route::post('/fee/category/update/{id}', [FeeCategoryController::class, 'UpdateFee'])->name('fee.category.update');
        Route::get('/fee/category/delete/{id}', [FeeCategoryController::class, 'DeleteFee'])->name('fee.category.delete');


        //Student Fee Amount Routes
        Route::get('/fee/amount/view', [FeeAmountController::class, 'ViewFeeAmount'])->name('fee.amount.view');
        Route::get('/fee/amount/add', [FeeAmountController::class, 'AddFeeAmount'])->name('fee.amount.add');
        Route::post('/fee/amount/store', [FeeAmountController::class, 'StoreFeeAmount'])->name('fee.amount.store');

        Route::get('/fee/amount/edit/{fee_category_id}', [FeeAmountController::class, 'EditFeeAmount'])->name('fee.amount.edit');
        Route::post('/fee/amount/update/{fee_category_id}', [FeeAmountController::class, 'UpdateFeeAmount'])->name('fee.amount.update');
        Route::get('fee/amount/details/{fee_category_id}', [FeeAmountController::class, 'DetailsFeeAmount'])->name('fee.amount.details');

        // Route::get('/fee/amount/delete/{fee_category_id}', [FeeAmountController::class, 'DeleteFeeAmount'])->name('fee.amount.delete');



        //Student Exam Type Routes
        Route::get('exam/type/view', [ExamTypeController::class, 'ViewExamType'])->name('exam.type.view');
        Route::get('exam/type/add', [ExamTypeController::class, 'ExamTypeAdd'])->name('exam.type.add');
        Route::post('exam/type/store', [ExamTypeController::class, 'ExamTypeStore'])->name('store.exam.type');
        Route::get('exam/type/edit/{id}', [ExamTypeController::class, 'ExamTypeEdit'])->name('exam.type.edit');
        Route::post('exam/type/update/{id}', [ExamTypeController::class, 'ExamTypeUpdate'])->name('update.exam.type');
        Route::get('exam/type/delete/{id}', [ExamTypeController::class, 'ExamTypeDelete'])->name('exam.type.delete');


        //School Subject Routes
        Route::get('school/subject/view', [SchoolSubjectController::class, 'ViewSubject'])->name('school.subject.view');
        Route::get('school/subject/add', [SchoolSubjectController::class, 'SubjectAdd'])->name('school.subject.add');
        Route::post('school/subject/store', [SchoolSubjectController::class, 'SubjectStore'])->name('store.school.subject');
        Route::get('school/subject/edit/{id}', [SchoolSubjectController::class, 'SubjectEdit'])->name('school.subject.edit');
        Route::post('school/subject/update/{id}', [SchoolSubjectController::class, 'SubjectUpdate'])->name('update.school.subject');
        Route::get('school/subject/delete/{id}', [SchoolSubjectController::class, 'SubjectDelete'])->name('school.subject.delete');



        // Assign Subject Routes
        Route::get('assign/subject/view', [AssignSubjectController::class, 'ViewAssignSubject'])->name('assign.subject.view');
        Route::get('assign/subject/add', [AssignSubjectController::class, 'AddAssignSubject'])->name('assign.subject.add');
        Route::post('assign/subject/store', [AssignSubjectController::class, 'StoreAssignSubject'])->name('store.assign.subject');
        Route::get('assign/subject/edit/{class_id}', [AssignSubjectController::class, 'EditAssignSubject'])->name('assign.subject.edit');
        Route::post('assign/subject/update/{class_id}', [AssignSubjectController::class, 'UpdateAssignSubject'])->name('update.assign.subject');
        Route::get('assign/subject/details/{class_id}', [AssignSubjectController::class, 'DetailsAssignSubject'])->name('assign.subject.details');



        //Designation Routes
        Route::get('designation/view', [DesignationController::class, 'ViewDesignation'])->name('designation.view');
        Route::get('designation/add', [DesignationController::class, 'DesignationAdd'])->name('designation.add');
        Route::post('designation/store', [DesignationController::class, 'DesignationStore'])->name('designation.store');
        Route::get('designation/edit/{id}', [DesignationController::class, 'DesignationEdit'])->name('designation.edit');
        Route::post('designation/update/{id}', [DesignationController::class, 'DesignationUpdate'])->name('designation.update');
        Route::get('designation/delete/{id}', [DesignationController::class, 'DesignationDelete'])->name('designation.delete');

    });

    Route::prefix('students')->group(function () {

        //Student Registration Routes
        Route::get('/registration/view', [StudentRegController::class, 'ViewStudentRegister'])->name('student.registration.view');
        Route::get('/registration/add', [StudentRegController::class, 'StudentRegisterAdd'])->name('student.registration.add');
        Route::post('/registration/store', [StudentRegController::class, 'StudentRegisterStore'])->name('student.registration.store');

        Route::get('/year/class/wise', [StudentRegController::class, 'StudentClassYearWise'])->name('student.year.class.wise');
        Route::get('/registration/edit/{student_id}', [StudentRegController::class, 'StudentRegisterEdit'])->name('student.registration.edit');

        Route::post('/registration/update/{student_id}', [StudentRegController::class, 'StudentRegisterUpdate'])->name('update.student.registration');

        Route::get('/reg/promotion/{student_id}', [StudentRegController::class, 'StudentRegPromotion'])->name('student.registration.promotion');

        Route::post('/reg/update/promotion/{student_id}', [StudentRegController::class, 'StudentUpdatePromotion'])->name('promotion.student.registration');

        Route::get('/reg/details/{student_id}', [StudentRegController::class, 'StudentRegDetails'])->name('student.registration.details');
        Route::get('/reg/role/', [StudentRoleController::class, 'StudentRegRole'])->name('role.generate.view');
        Route::get('/reg/getstudents', [StudentRoleController::class, 'GetStudents'])->name('student.registration.getstudents');
        Route::post('/reg/storestudents', [StudentRoleController::class, 'StudentRoleStore'])->name('role.generate.store');

        Route::get('/reg/fee/view', [RegistrationFeeController::class, 'RegFeeView'])->name('reg.fee.view');
        Route::get('/reg/fee/classwisedata', [RegistrationFeeController::class, 'RegFeeClassData'])->name('student.registration.fee.classwise.get');

        Route::get('/reg/fee/payslip', [RegistrationFeeController::class, 'RegFeePayslip'])->name('student.registration.fee.payslip');

        Route::get('/monthly/fee/view', [MonthlyFeeController::class, 'MonthlyFeeView'])->name('monthly.fee.view');
        Route::get('/monthly/fee/classwisedata', [MonthlyFeeController::class, 'MonthlyFeeClassData'])->name('student.monthly.fee.classwise.get');
        Route::get('/monthly/fee/payslip', [MonthlyFeeController::class, 'MonthlyFeePayslip'])->name('student.monthly.fee.payslip');

        //Exam Fee Routes
        Route::get('/exam/fee/view', [ExamFeeController::class, 'ExamFeeView'])->name('exam.fee.view');
        Route::get('/exam/fee/classwisedata', [ExamFeeController::class, 'ExamFeeClassData'])->name('student.exam.fee.classwise.get');
        Route::get('/exam/fee/payslip', [ExamFeeController::class, 'ExamFeePayslip'])->name('student.exam.fee.payslip');

    });


        /// Employee Registration Routes
    Route::prefix('employees')->group(function(){

        Route::get('reg/employee/view', [EmployeeRegController::class, 'EmployeeView'])->name('employee.registration.view');

        Route::get('reg/employee/add', [EmployeeRegController::class, 'EmployeeAdd'])->name('employee.registration.add');

        Route::post('reg/employee/store', [EmployeeRegController::class, 'EmployeeStore'])->name('store.employee.registration');

        Route::get('reg/employee/edit/{id}', [EmployeeRegController::class, 'EmployeeEdit'])->name('employee.registration.edit');

        Route::post('reg/employee/update/{id}', [EmployeeRegController::class, 'EmployeeUpdate'])->name('update.employee.registration');

        Route::get('reg/employee/details/{id}', [EmployeeRegController::class, 'EmployeeDetails'])->name('employee.registration.details');

        // Employee Salary All Routes
        Route::get('salary/employee/view', [EmployeeSalaryController::class, 'SalaryView'])->name('employee.salary.view');

        Route::get('salary/employee/increment/{id}', [EmployeeSalaryController::class, 'SalaryIncrement'])->name('employee.salary.increment');

        Route::post('salary/employee/store/{id}', [EmployeeSalaryController::class, 'SalaryStore'])->name('update.increment.store');

        Route::get('salary/employee/details/{id}', [EmployeeSalaryController::class, 'SalaryDetails'])->name('employee.salary.details');


        // Employee Leave All Routes
        Route::get('leave/employee/view', [EmployeeLeaveController::class, 'LeaveView'])->name('employee.leave.view');

        Route::get('leave/employee/add', [EmployeeLeaveController::class, 'LeaveAdd'])->name('employee.leave.add');

        Route::post('leave/employee/store', [EmployeeLeaveController::class, 'LeaveStore'])->name('store.employee.leave');

        Route::get('leave/employee/edit/{id}', [EmployeeLeaveController::class, 'LeaveEdit'])->name('employee.leave.edit');

        Route::post('leave/employee/update/{id}', [EmployeeLeaveController::class, 'LeaveUpdate'])->name('update.employee.leave');

        Route::get('leave/employee/delete/{id}', [EmployeeLeaveController::class, 'LeaveDelete'])->name('employee.leave.delete');


        // Employee Attendance All Routes
        Route::get('attendance/employee/view', [EmployeeAttendanceController::class, 'AttendanceView'])->name('employee.attendance.view');

        Route::get('attendance/employee/add', [EmployeeAttendanceController::class, 'AttendanceAdd'])->name('employee.attendance.add');

        Route::post('attendance/employee/store', [EmployeeAttendanceController::class, 'AttendanceStore'])->name('store.employee.attendance');

        Route::get('attendance/employee/edit/{date}', [EmployeeAttendanceController::class, 'AttendanceEdit'])->name('employee.attendance.edit');

        Route::get('attendance/employee/details/{date}', [EmployeeAttendanceController::class, 'AttendanceDetails'])->name('employee.attendance.details');


        // Employee Monthly Salary All Routes
        Route::get('monthly/salary/view', [MonthlySalaryController::class, 'MonthlySalaryView'])->name('employee.monthly.salary');

        Route::get('monthly/salary/get', [MonthlySalaryController::class, 'MonthlySalaryGet'])->name('employee.monthly.salary.get');

        Route::get('monthly/salary/payslip/{employee_id}', [MonthlySalaryController::class, 'MonthlySalaryPayslip'])->name('employee.monthly.salary.payslip');


    });



    /// Marks Management Routes
    Route::prefix('marks')->group(function(){

        Route::get('marks/entry/add', [MarksController::class, 'MarksAdd'])->name('marks.entry.add');

        Route::post('marks/entry/store', [MarksController::class, 'MarksStore'])->name('marks.entry.store');

        Route::get('marks/entry/edit', [MarksController::class, 'MarksEdit'])->name('marks.entry.edit');

        Route::get('marks/getstudents/edit', [MarksController::class, 'MarksEditGetStudents'])->name('student.edit.getstudents');

        Route::post('marks/entry/update', [MarksController::class, 'MarksUpdate'])->name('marks.entry.update');

        // Marks Entry Grade

        Route::get('marks/grade/view', [GradeController::class, 'MarksGradeView'])->name('marks.entry.grade');

        Route::get('marks/grade/add', [GradeController::class, 'MarksGradeAdd'])->name('marks.grade.add');

        Route::post('marks/grade/store', [GradeController::class, 'MarksGradeStore'])->name('store.marks.grade');

        Route::get('marks/grade/edit/{id}', [GradeController::class, 'MarksGradeEdit'])->name('marks.grade.edit');

        Route::post('marks/grade/update/{id}', [GradeController::class, 'MarksGradeUpdate'])->name('update.marks.grade');

    });

    Route::get('marks/getsubject', [DefaultController::class, 'GetSubject'])->name('marks.getsubject');

    Route::get('student/marks/getstudents', [DefaultController::class, 'GetStudents'])->name('student.marks.getstudents');


    /// Account Management Routes
Route::prefix('accounts')->group(function(){

Route::get('student/fee/view', [StudentFeeController::class, 'StudentFeeView'])->name('student.fee.view');

Route::get('student/fee/add', [StudentFeeController::class, 'StudentFeeAdd'])->name('student.fee.add');

Route::get('student/fee/getstudent', [StudentFeeController::class, 'StudentFeeGetStudent'])->name('account.fee.getstudent');

Route::post('student/fee/store', [StudentFeeController::class, 'StudentFeeStore'])->name('account.fee.store');

// Employee Salary Routes
Route::get('account/salary/view', [AccountSalaryController::class, 'AccountSalaryView'])->name('account.salary.view');

Route::get('account/salary/add', [AccountSalaryController::class, 'AccountSalaryAdd'])->name('account.salary.add');

Route::get('account/salary/getemployee', [AccountSalaryController::class, 'AccountSalaryGetEmployee'])->name('account.salary.getemployee');

Route::post('account/salary/store', [AccountSalaryController::class, 'AccountSalaryStore'])->name('account.salary.store');

// Other Cost Rotues

Route::get('other/cost/view', [OtherCostController::class, 'OtherCostView'])->name('other.cost.view');

Route::get('other/cost/add', [OtherCostController::class, 'OtherCostAdd'])->name('other.cost.add');

Route::post('other/cost/store', [OtherCostController::class, 'OtherCostStore'])->name('store.other.cost');

Route::get('other/cost/edit/{id}', [OtherCostController::class, 'OtherCostEdit'])->name('edit.other.cost');

Route::post('other/cost/update/{id}', [OtherCostController::class, 'OtherCostUpdate'])->name('update.other.cost');

});



/// Report Management All Routes
Route::prefix('reports')->group(function(){

Route::get('monthly/profit/view', [ProfiteController::class, 'MonthlyProfitView'])->name('monthly.profit.view');

Route::get('monthly/profit/datewais', [ProfiteController::class, 'MonthlyProfitDatewais'])->name('report.profit.datewais.get');

Route::get('monthly/profit/pdf', [ProfiteController::class, 'MonthlyProfitPdf'])->name('report.profit.pdf');

// MarkSheet Generate Routes
Route::get('marksheet/generate/view', [MarkSheetController::class, 'MarkSheetView'])->name('marksheet.generate.view');

Route::get('marksheet/generate/get', [MarkSheetController::class, 'MarkSheetGet'])->name('report.marksheet.get');


// Attendance Report Routes
Route::get('attendance/report/view', [AttenReportController::class, 'AttenReportView'])->name('attendance.report.view');

Route::get('report/attendance/get', [AttenReportController::class, 'AttenReportGet'])->name('report.attendance.get');

// Student Result Report Routes
Route::get('student/result/view', [ResultReportController::class, 'ResultView'])->name('student.result.view');

Route::get('student/result/get', [ResultReportController::class, 'ResultGet'])->name('report.student.result.get');

// Student ID Card Routes
Route::get('student/idcard/view', [ResultReportController::class, 'IdcardView'])->name('student.idcard.view');

Route::get('student/idcard/get', [ResultReportController::class, 'IdcardGet'])->name('report.student.idcard.get');

});


}); // End Middleare Auth Route
