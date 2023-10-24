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
use App\Models\Subject;
use App\mPDF\PdfWrapper;

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
            $schedule = $data->schedule_id;
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
    public function edit(Request $request, $id)
    {
        $data =  Schedule::where('class_id', $id)->first();
        $day =  Day::all();
        $timeData = [];

        if (!empty($data)) {
            $schedule = $data->schedule_id;
            $timeData =  Time::with([
                'getSchedule.subject.subject', 'getSchedule' => function ($query) use ($schedule) {
                    $query->where('schedule_id', $schedule);
                }
            ])->get();
        }
        foreach ($timeData as $ix => $obj) {
            foreach ($day as $index => $data) {
                // បាន​ហៅ វត្តមានហើយ
                if (count($obj->getSchedule) != 0) {
                    foreach ($obj->getSchedule as $si => $scd) {
                        if ($data->day_id == $obj->getSchedule[$si]->day_id) {
                            $obj['subject_grade_day_' . $data->day_id] = $obj->getSchedule[$si]->subject_grade_id;
                            // $sub = Subject::find($obj->getSchedule[$si]->subject_grade_id);
                            $obj['name_subject_grade_day_' . $data->day_id] = !empty($obj->getSchedule[$si]->subject) ? $obj->getSchedule[$si]->subject : '';
                        }
                    }
                } else {
                    // មិនទាន់
                    $obj['subject_grade_day_' . $data->day_id] = null;
                }
            }
        }
        $response = [
            'data' => $timeData,
        ];
        return  response($response, 200);
    }

    public function  getScheduleDayTime(Request $request, $id)
    {
        $class = Classes::where('class_id', $id)->select('grade_level_id', 'class_type_id')->first();
        $day =  Day::all();
        $time = Time::all();
        $subject = SubjectGradeLevel::where('grade_level_id', $class->grade_level_id)->where('class_type_id', $class->class_type_id)->with('subject')->get();
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
    public  function create(Request $request, $id)
    {
        $days =  Day::all();
        DB::transaction(function () use ($request, $id, $days) {
            $schedule = Schedule::where('class_id', $id)->first();
            if (empty($schedule)) {
                $schedule = Schedule::create([
                    'class_id' => $id,
                ]);
            }
            $data = $request->data;
            if ($data) {
                ScheduleLine::where('schedule_id', $id)->delete();
                $ObjData =  [];
                foreach ($data as $row) {
                    foreach ($days as $day) {
                        // dd($row);
                        if (isset($row['subject_grade_day_' . $day->day_id]) && $row['subject_grade_day_' . $day->day_id] != null) {
                            $subDay =  [
                                'schedule_id' => $id,
                                'subject_grade_id' => $row['subject_grade_day_' . $day->day_id],
                                'time_id' => $row['time_id'],
                                'day_id' => $day->day_id,
                            ];
                            array_push($ObjData, $subDay);
                        }
                    }
                }
                ScheduleLine::Insert($ObjData);
            }
            $response = [
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
            if (!empty($request->id)) {
                $teacherData =  TeacherClass::where('id', $request->id)->update([
                    'class_id' => $request->class_id,
                    'teacher_id' => $request->teacher_id,
                    'subject_grade_id' => $request->subject_grade_id,
                    'role_id' => $request->role_id,
                ]);
            } else {
                $teacherData =  TeacherClass::create([
                    'class_id' => $request->class_id,
                    'teacher_id' => $request->teacher_id,
                    'subject_grade_id' => $request->subject_grade_id,
                    'role_id' => $request->role_id,
                ]);
            }
            $response = [
                'teacher_class' => $teacherData,
                'message' => "Teacher class  was created."
            ];
            return  response($response, 201);
        });
    }

    public function editTeacher(Request $request, $id)
    {
        $teacherData =  TeacherClass::where('id', $id)->first();
        $response = [
            'teacher_class' => $teacherData,
            'message' => "Teacher class  was created."
        ];
        return  response($response, 200);
    }

    public function exportExcel(Request $request, $id)
    {
        $data =  Schedule::where('class_id', $id)->first();
        $day =  Day::all();
        $class = Classes::find($id);
        $timeData = [];

        if (!empty($data)) {
            $schedule = $data->schedule_id;
            $timeData =  Time::with([
                'getSchedule.subject.subject', 'getSchedule' => function ($query) use ($schedule) {
                    $query->where('schedule_id', $schedule);
                }
            ])->get();
        }
        foreach ($timeData as $ix => $obj) {
            foreach ($day as $index => $data) {
                // បាន​ហៅ វត្តមានហើយ
                if (count($obj->getSchedule) != 0) {
                    foreach ($obj->getSchedule as $si => $scd) {
                        if ($data->day_id == $obj->getSchedule[$si]->day_id) {
                            $obj['subject_grade_day_' . $data->day_id] = $obj->getSchedule[$si]->subject_grade_id;
                            // $sub = Subject::find($obj->getSchedule[$si]->subject_grade_id);
                            $obj['name_subject_grade_day_' . $data->day_id] = !empty($obj->getSchedule[$si]->subject) ? $obj->getSchedule[$si]->subject : '';
                        }
                    }
                } else {
                    // មិនទាន់
                    $obj['subject_grade_day_' . $data->day_id] = null;
                }
            }
        }

        //return "hi";
        $pdf = PdfWrapper::loadView('Schedule.subject', [
            'data' => $timeData,
            'option' => [
                'day' => $day,
                'time' => Time::all(),
                'class' => $class,
                'academic' => $class->academic,
            ]
        ]);
        // return $pdf;
        return $pdf->stream('schedule.pdf');
    }
}
