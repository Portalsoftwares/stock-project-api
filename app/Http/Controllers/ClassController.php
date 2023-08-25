<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\Classes;
use App\Models\TeacherClass;
use App\Models\StudentClass;
use App\Models\Schedule;



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
        $student = StudentClass::where('class_id', $id)->with(['student_in_class.profile_img'])->get();
        $response = [
            'teacher' => $teacher,
            'student' => $student,
            'class' => $class,
        ];
        return  response($response, 200);
    }
    public function create(Request  $request)
    {
        $validator = Validator::make($request->all(), [
            'class_name' => ['required'],
            'class_type_id' => ['required', 'exists:class_type,class_type_id'],
            'grade_level_id' => ['required', 'exists:grade_level,grade_level_id'],
            'academic_id' => ['required', 'exists:academic,academic_id'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }

        DB::transaction(function () use ($validator) {
            $class = new Classes();
            $class->fill($validator->validated());
            $class->save();
            if (!empty($class)) {
                $schedule = Schedule::create([
                    'class_id' => $class->class_id,
                ]);
            }
        });
        $response = [
            'message' => 'successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $items = Classes::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'class_name' => ['required'],
            'class_type_id' => ['required', 'exists:class_type,class_type_id'],
            'grade_level_id' => ['required', 'exists:grade_level,grade_level_id'],
            'academic_id' => ['required', 'exists:academic,academic_id'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $id) {
            $items = Classes::find($id);
            $items->fill($validator->validated());
            $items->save();
        });

        $response = [
            'data' => 'Update successfull',
        ];
        return  response($response, 200);
    }


    public function delete($id)
    {
        DB::transaction(function () use ($id) {
            //Delete soft
            $items = Classes::find($id);
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = Classes::onlyTrashed()->where('class_id', $id);
                if (!empty($items)) {
                    $items->forceDelete();
                }
            }
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }
}
