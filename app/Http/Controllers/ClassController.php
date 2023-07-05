<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Classes;
use App\Models\TeacherClass;
use App\Models\StudentClass;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teacher =  Classes::with(['class_type', 'academic', 'count_student_in_class.student_in_class', 'get_teacher_in_class.teacher_in_class', 'get_teacher_in_class.teacher_subject_in_class'])->get();
        $response = [
            'data' => $teacher,
        ];
        return  response($response, 200);
    }

    public function getTeacher(Request  $request, $id)
    {
        $teacher = TeacherClass::where('class_id', $id)->with(['teacher_subject_in_class.subject', 'teacher_in_class'])->get();
        $class = Classes::where('class_id', $id)->first();
        $student = StudentClass::where('class_id', $id)->with(['student_in_class'])->get();
        $response = [
            'teacher' => $teacher,
            'student' => $student,
            'class' => $class,
        ];
        return  response($response, 200);
    }
}
