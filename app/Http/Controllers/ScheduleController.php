<?php

namespace App\Http\Controllers;

use App\Models\Classes;
use Illuminate\Http\Request;
use App\Models\Schedule;
use App\Models\ScheduleLine;
use App\Models\Day;

use App\Models\SubjectGradeLevel;
use App\Models\Teacher;
use App\Models\TeacherClass;
use App\Models\Time;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id)
    {
        $data =  Schedule::where('class_id', $id)->first();
        $schedule = [];
        $timeData = [];
        if (!empty($data)) {
            $schedule = $data->class_id;
            $timeData =  Time::with([
                'getSchedule.subject.subject', 'getSchedule' => function ($query) use ($schedule) {
                    $query->where('schedule_id', $schedule);
                }
            ])->get();
        }
        $response = [
            'data' => $timeData,
        ];
        return  response($response, 200);
    }

    public function  getScheduleDayTime(Request $request, $id)
    {
        $classType = Classes::where('class_id', $id)->select('class_type_id')->first();
        $day =  Day::all();
        $time = Time::all();
        $subject = SubjectGradeLevel::where('grade_level_id', $id)->where('class_type_id', $classType->class_type_id)->with('subject')->get();
        $teacher = Teacher::all();
        $data =  [
            'day' => $day,
            'time' => $time,
            'subject' => $subject,
            'teacher' => $teacher
        ];
        $response = [
            'data' => $data
        ];
        return  response($response, 200);
    }
    //create schedule class
    public  function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'class_id' => ['required', 'exists:class,class_id'],
            'time_id' => [
                'required', 'exists:time,time_id',
                Rule::unique('schedule_line')->where(function ($query) use ($request) {
                    return $query->where('time_id', $request->time_id)->where('day_id', $request->day_id)->where('schedule_id', $request->class_id)->get();
                })
            ],
            'subject_grade_id' => [
                'required', 'exists:subject_grade_level,subject_grade_id',
                Rule::unique('schedule_line')->where(function ($query) use ($request) {
                    return $query->where('subject_grade_id', $request->subject_grade_id)->where('time_id', $request->time_id)->where('day_id', $request->day_id)->where('schedule_id', $request->class_id)->get();
                })
            ],
            'day_id' => [
                'required', 'exists:day,day_id',
                Rule::unique('schedule_line')->where(function ($query) use ($request) {
                    return $query->where('subject_grade_id', $request->subject_grade_id)->where('time_id', $request->time_id)->where('day_id', $request->day_id)->where('schedule_id', $request->class_id)->get();
                })
            ],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($request) {
            $schedule = Schedule::where('class_id', $request->class_id)->first();
            if (empty($schedule)) {
                $schedule = Schedule::create([
                    'class_id' => $request->class_id,
                ]);
            }
            $subDay =  ScheduleLine::create([
                'schedule_id' => $schedule->schedule_id,
                'subject_grade_id' => $request->subject_grade_id,
                'time_id' => $request->time_id,
                'day_id' => $request->day_id,
            ]);
            $response = [
                'sch_class' => $schedule,
                'sub_day' => $subDay,
                'message' => "Schedule class  was created."
            ];
            return  response($response, 201);
        });
    }
    //create schedule class
    public  function createTeacher(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'class_id' => ['required', 'exists:class,class_id'],
            'subject_grade_id' => [
                'required', 'exists:subject_grade_level,subject_grade_id',
                Rule::unique('teacher_class')->where(function ($query) use ($request) {
                    return $query->where('subject_grade_id', $request->subject_grade_id)->where('teacher_id', $request->teacher_id)->where('class_id', $request->class_id)->get();
                })
            ],
            'teacher_id' => [
                'required', 'exists:teacher,teacher_id',
                Rule::unique('teacher_class')->where(function ($query) use ($request) {
                    return $query->where('teacher_id', $request->teacher_id)->where('subject_grade_id', $request->subject_id)->where('class_id', $request->class_id)->get();
                })
            ],
            'role_id' => [
                Rule::unique('teacher_class')->where(function ($query) use ($request) {
                    if ($request->role_id == 1) {
                        return  $query->where('role_id', $request->role_id)->where('class_id', $request->class_id)->get();
                    } else {
                        return $query->where('role_id', 2)->where('class_id', $request->class_id)->get();
                    }
                })
            ],
        ]);
        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($request) {
            $teacherData =  TeacherClass::create([
                'class_id' => $request->class_id,
                'teacher_id' => $request->teacher_id,
                'subject_grade_id' => $request->subject_grade_id,
                'role_id' => $request->role_id,
            ]);
            $response = [
                'teacher_class' => $teacherData,
                'message' => "Teacher class  was created."
            ];
            return  response($response, 201);
        });
    }
}
