<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Academic;
use App\Models\Attendance;
use App\Models\AttendanceLine;
use App\Models\Classes;
use App\Models\Student;
use App\Models\StudentClass;
use App\Models\Teacher;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;

class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $academics = Academic::all();
        //Attenance
        $attendance = Attendance::whereHas('class', function ($query) use ($request) {
            $query->where('academic_id', $request->acc);
        })->pluck('attendance_id');
        $ps = AttendanceLine::whereIn('attendance_id', $attendance)->where('attendance_type_id', 1)->count();
        $pm = AttendanceLine::whereIn('attendance_id', $attendance)->where('attendance_type_id', 2)->count();
        $al = AttendanceLine::whereIn('attendance_id', $attendance)->where('attendance_type_id', 3)->count();
        $a =  AttendanceLine::whereIn('attendance_id', $attendance)->where('attendance_type_id', 4)->count();
        //Student by class type
        $studentClassMan1 = StudentClass::whereHas('class', function ($query) use ($request) {
            $query->where([['academic_id', $request->acc], ['class_type_id', 1]]);
        })->whereHas('student_in_class', function ($query) use ($request) {
            $query->where('gender_id', 1);
        })->count();
        $studentClassWoman1 = StudentClass::whereHas('class', function ($query) use ($request) {
            $query->where([['academic_id', $request->acc], ['class_type_id', 1]]);
        })->whereHas('student_in_class', function ($query) use ($request) {
            $query->where('gender_id', 2);
        })->count();

        $studentClassMan2 = StudentClass::whereHas('class', function ($query) use ($request) {
            $query->where([['academic_id', $request->acc], ['class_type_id', 2]]);
        })->whereHas('student_in_class', function ($query) use ($request) {
            $query->where('gender_id', 1);
        })->count();
        $studentClassWoman2 = StudentClass::whereHas('class', function ($query) use ($request) {
            $query->where([['academic_id', $request->acc], ['class_type_id', 2]]);
        })->whereHas('student_in_class', function ($query) use ($request) {
            $query->where('gender_id', 2);
        })->count();

        $studentClassMan3 = StudentClass::whereHas('class', function ($query) use ($request) {
            $query->where([['academic_id', $request->acc], ['class_type_id', 3]]);
        })->whereHas('student_in_class', function ($query) use ($request) {
            $query->where('gender_id', 1);
        })->count();
        $studentClassWoman3 = StudentClass::whereHas('class', function ($query) use ($request) {
            $query->where([['academic_id', $request->acc], ['class_type_id', 3]]);
        })->whereHas('student_in_class', function ($query) use ($request) {
            $query->where('gender_id', 2);
        })->count();
        $studen1 = [$studentClassMan1, $studentClassMan2, $studentClassMan3];
        $studen2 = [$studentClassWoman1, $studentClassWoman2, $studentClassWoman3];


        //total student
        $totalsStudent = Student::count();
        $totalsStudent1 = Student::where('gender_id', 1)->count();
        $totalsStudent2 = Student::where('gender_id', 2)->count();
        //total teacher
        $totalsTeacher = Teacher::count();
        $totalsTeacher1 = Teacher::where('gender_id', 1)->count();
        $totalsTeacher2 = Teacher::where('gender_id', 2)->count();
        //total user
        $totalsUser = User::count();
        $types = ['', 'success', 'info'];
        $totalsRole = Role::all()->map(function ($item, $index) use ($types) {
            return [
                "type" => $types[$index],
                "label" => $item["name"]
            ];
        });
        //total class
        $totalsClass = Classes::where('academic_id', $request->acc)->count();
        $totalsClass1 = Classes::where('academic_id', $request->acc)->where('class_type_id', 1)->count();
        $totalsClass2 = Classes::where('academic_id', $request->acc)->where('class_type_id', 2)->count();
        $totalsClass3 = Classes::where('academic_id', $request->acc)->where('class_type_id', 3)->count();

        $response = [
            'data' => [
                'academics' => $academics,
                'student' => [
                    'total' => $totalsStudent,
                    'st1' => $totalsStudent1,
                    'st2' => $totalsStudent2,
                ],
                'teacher' => [
                    'total' => $totalsTeacher,
                    'tc1' => $totalsTeacher1,
                    'tc2' => $totalsTeacher2,
                ],
                'user' => [
                    'total' => $totalsUser,
                    'role' => $totalsRole
                ],
                'class' => [
                    'total' => $totalsClass,
                    'cl1' => $totalsClass1,
                    'cl2' => $totalsClass2,
                    'cl3' => $totalsClass3,
                ],
                'attendance' => [$ps, $pm, $al, $a],
                'student_class_type' => [
                    'st1' =>  $studen1,
                    'st2' =>  $studen2,
                ],
            ],
        ];
        return  response($response, 200);
    }
}
