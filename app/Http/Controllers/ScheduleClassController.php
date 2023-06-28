<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScheduleClass;
use App\Models\SubjectScheduleDay;
use App\Models\Day;
use App\Models\Subject;
use App\Models\Teacher;
use App\Models\TeacherClass;
use App\Models\Time;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ScheduleClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id)
    {
        $data =  ScheduleClass::where('grade_level_id', $id)->first();
        $schedule = [];
        $timeData = [];
        if (!empty($data)) {
            $schedule = $data->grade_level_id;
            $timeData =  Time::with([
                'getSchedule.subject', 'getSchedule' => function ($query) use ($schedule) {
                    $query->where('schedule_class_id', $schedule);
                }
            ])->get();
        }
        $response = [
            'data' => $timeData,
        ];
        return  response($response, 200);
    }

    public function  getScheduleDayTime()
    {
        $day =  Day::all();
        $time = Time::all();
        $subject = Subject::all();
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
            'class_id' => ['required', 'exists:grade_level,grade_level_id'],
            'time_id' => [
                'required', 'exists:time,id',
                Rule::unique('subject_day_schedule')->where(function ($query) use ($request) {
                    return $query->where('time_id', $request->time_id)->where('day_id', $request->day_id)->where('schedule_class_id', $request->class_id)->get();
                })
            ],
            'subject_id' => [
                'required', 'exists:subject,subject_id',
                Rule::unique('subject_day_schedule')->where(function ($query) use ($request) {
                    return $query->where('subject_id', $request->subject_id)->where('time_id', $request->time_id)->where('day_id', $request->day_id)->where('schedule_class_id', $request->class_id)->get();
                })
            ],
            'day_id' => [
                'required', 'exists:day,id',
                Rule::unique('subject_day_schedule')->where(function ($query) use ($request) {
                    return $query->where('subject_id', $request->subject_id)->where('time_id', $request->time_id)->where('day_id', $request->day_id)->where('schedule_class_id', $request->class_id)->get();
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
            $schedule = ScheduleClass::where('grade_level_id', $request->class_id)->first();
            if (empty($schedule)) {
                $schedule = ScheduleClass::create([
                    'grade_level_id' => $request->class_id,
                ]);
            }
            $subDay =  SubjectScheduleDay::create([
                'schedule_class_id' => $schedule->grade_level_id,
                'subject_id' => $request->subject_id,
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
            'class_id' => ['required', 'exists:grade_level,grade_level_id'],
            'subject_id' => [
                'required', 'exists:subject,subject_id',
                Rule::unique('teacher_class')->where(function ($query) use ($request) {
                    return $query->where('subject_id', $request->subject_id)->where('teacher_id', $request->teacher_id)->where('grade_level_id', $request->class_id)->get();
                })
            ],
            'teacher_id' => [
                'required', 'exists:teacher,teacher_id',
                Rule::unique('teacher_class')->where(function ($query) use ($request) {
                    return $query->where('teacher_id', $request->teacher_id)->where('subject_id', $request->subject_id)->where('grade_level_id', $request->class_id)->get();
                })
            ],
            'role' => [
                Rule::unique('teacher_class')->where(function ($query) use ($request) {
                    if ($request->role == 1) {
                        return  $query->where('role', $request->role)->where('grade_level_id', $request->class_id)->get();
                    } else {
                        return $query->where('role', 2)->where('grade_level_id', $request->class_id)->get();
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
                'grade_level_id' => $request->class_id,
                'teacher_id' => $request->teacher_id,
                'subject_id' => $request->subject_id,
                'role' => $request->role,
            ]);
            $response = [
                'teacher_class' => $teacherData,
                'message' => "Teacher class  was created."
            ];
            return  response($response, 201);
        });
    }
}
