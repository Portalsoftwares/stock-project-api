<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\AttendanceLine;
use App\Models\Classes;
use App\Models\Day;
use App\Models\scoreType;
use App\Models\Time;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\StudentClass;
use App\Models\Subject;
use App\Models\SubjectGradeLevel;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use App\Models\TeacherClass;

class AttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }
    public function getCallAttendance(Request $request, $id)
    {

        $classData = Classes::find($id);
        $teacherSubject = TeacherClass::where('class_id', $id)->with(['teacher_subject_in_class.subject', 'teacher_in_class'])->get();
        $student =   StudentClass::query()->where('class_id', $id)->with(['student_in_class.gender', 'student_in_class.status'])->get();
        $day =   Day::all();
        $time =   Time::all();
        // $subject =  SubjectGradeLevel::where('grade_level_id', 1)->with('subject')->get();
        foreach ($student as $index => $data) {
            // មិនទាន់
            $data['attendance_type_id'] = null;
        }
        $response = [
            'data' => $student,
            'day' => $day,
            'time' => $time,
            'teacher_subject' => $teacherSubject,
            'classData' => $classData,
        ];

        return  response($response, 200);
    }
    public function callStudentAttendance(Request $request, $id)
    {
        // dd(1);
        $class_id =  $request->class_id;
        $time_id = $request->time_id;
        $day_id =  $request->day_id;
        $subject_grade_id = $request->subject_grade_id;

        $attendance = Attendance::where(function ($query) use ($class_id, $time_id, $day_id, $subject_grade_id) {
            $query->where('class_id', $class_id)->where('time_id', $time_id)->where('day_id', $day_id)->where('subject_grade_id', $subject_grade_id)->whereDate('date', Carbon::today());
        })->first();

        $attendanceLine = [];
        if (!empty($attendance)) {
            $attendanceLine = AttendanceLine::where('attendance_id', $attendance->attendance_id)->get();
        }
        $student =   StudentClass::query()->where('class_id', $id)->with(['student_in_class.gender', 'student_in_class.status'])->get();
        $day =   Day::where('day_id', $day_id)->first();
        $time =   Time::where('time_id', $time_id)->first();
        $subject =   SubjectGradeLevel::where('subject_grade_id', $subject_grade_id)->with('subject')->first();
        foreach ($student as $index => $data) {
            // បាន​ហៅ វត្តមានហើយ
            if (!empty($attendance)) {
                if ($data->student_id == $attendanceLine[$index]->student_id) {
                    $data['attendance_type_id'] = (string)  $attendanceLine[$index]->attendance_type_id;
                }
            } else {
                // មិនទាន់
                $data['attendance_type_id'] = null;
            }
        }
        $response = [
            'data' => $student,
            'day' => $day,
            'time' => $time,
            'subject' => $subject,
        ];

        return  response($response, 200);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        DB::transaction(function () use ($request) {
            $class_id = $request->class_id;
            $time_id = $request->time_id;
            $day_id = $request->day_id;
            $subject_grade_id = $request->subject_grade_id;
            $date = $request->date;
            $attendance = Attendance::where(function ($query) use ($class_id, $time_id, $day_id, $subject_grade_id, $date) {
                $query->where('class_id', $class_id)->where('time_id', $time_id)->where('day_id', $day_id)->where('subject_grade_id', $subject_grade_id)->whereDate('date', $date);
            })->first();
            if (empty($attendance)) {
                $attendance = Attendance::create(
                    [
                        'class_id' => $class_id,
                        'time_id' => $time_id,
                        'day_id' => $day_id,
                        'subject_grade_id' => $subject_grade_id,
                        'date' =>  $date
                    ]
                );
            };

            $data = $request->data ?? [];
            $attendanceLine = [];
            if (!empty($attendance)) {
                AttendanceLine::where('attendance_id', $attendance->attendance_id)->delete();
                foreach ($data as $row) {
                    $obj = [
                        'attendance_id' => $attendance->attendance_id,
                        'student_id' => $row['student_id'],
                        'attendance_type_id' => $row['attendance_type_id']
                    ];
                    array_push($attendanceLine, $obj);
                }
                //Insert attendanceline 
                AttendanceLine::insert($attendanceLine);
            }
        });
        $response = [
            'data' => 'successfull',
        ];
        return  response($response, 200);
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function reportInClass(Request $request)
    {

        $class_id =  $request->class_id;
        $classData = Classes::find($class_id);
        $subject_grade_id = $request->subject_grade_id;
        $dataSubjectGrade = SubjectGradeLevel::with('subject')->find($subject_grade_id);

        $attendance = Attendance::where(function ($query) use ($class_id, $subject_grade_id) {
            $query->where('class_id', $class_id)->where('subject_grade_id', $subject_grade_id);
        })->orderBy('date', 'ASC')->get();
        $student =   StudentClass::query()->where('class_id', $class_id)->with(['student_in_class.gender', 'student_in_class.status',])->get();
        foreach ($student as $stu_row) {
            $type_ps = 0;
            $type_pm = 0;
            $type_al = 0;
            $type_a = 0;
            foreach ($attendance as $att_row) {
                $attLine = AttendanceLine::where([['attendance_id', $att_row->attendance_id], ['student_id', $stu_row->student_id]])->with('attendance_type')->first();
                $type_ps += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '1']])->count();
                $type_pm += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '2']])->count();
                $type_al += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '3']])->count();
                $type_a  += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '4']])->count();
                if (!empty($attLine)) {
                    $fake_attendance = 'attendance_' . $att_row->attendance_id;
                    $stu_row[$fake_attendance] = $attLine->attendance_type->attendance_sort_name;
                }
            }
            $stu_row['total_type_ps'] = $type_ps;
            $stu_row['total_type_pm'] = $type_pm;
            $stu_row['total_type_al'] = $type_al;
            $stu_row['total_type_a']  = $type_a;
        }
        $response = [
            'attendance' => $attendance,
            'student' => $student,
            'classData' => $classData,
            'dataSubjectGrade' => $dataSubjectGrade,
        ];
        return  response($response, 200);
    }

    public function  reportInclassMonthly(Request $request)
    {
        $class_id =  $request->class_id;
        $classData = Classes::find($class_id);
        $month = scoreType::where('date', '!=', '0000-00-00')->get();
        $response = [
            'classData' => $classData,
            'month' => $month,
        ];
        return  response($response, 200);
    }
    public function  reportInclassMonthlyGenerate(Request $request)
    {

        $class_id =  $request->class_id;
        $classData = Classes::with('academic')->find($class_id);
        $start_academic_date = $classData->academic->end_date;
        $month_id = $request->month_id;
        $month = scoreType::find($month_id);
        $month_number = Carbon::parse($month->date)->format('m');
        $day_number_of_month = Carbon::parse($start_academic_date)->month($month_number)->daysInMonth;

        $start_month = Carbon::parse($start_academic_date)->month($month_number);
        $end_month = Carbon::parse($start_month)->endOfMonth();

        $period = CarbonPeriod::create($start_month, $end_month);
        foreach ($period as $date) {
            $dates[] = $date->format('Y-m-d');
        }


        // dd($dates);



        $student =   StudentClass::query()->where('class_id', $class_id)->with(['student_in_class.gender', 'student_in_class.status',])->get();
        foreach ($student as $stu_row) {
            // $type_ps = 0;
            $type_pm = 0;
            // $type_al = 0;
            $type_a = 0;
            foreach ($period as $date) {
                $attendance = Attendance::where(function ($query) use ($class_id, $date) {
                    $query->where([['class_id', $class_id], ['date', $date->format('Y-m-d')]]);
                })->orderBy('date', 'ASC')->get();

                if (count($attendance) > 0) {
                    // $type_ps_day = 0;
                    $type_pm_day = 0;
                    // $type_al_day = 0;
                    $type_a_day = 0;
                    foreach ($attendance as $att_row) {
                        // $type_ps_day += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '1']])->count();
                        $type_pm_day += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '2']])->count();
                        // $type_al_day += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '3']])->count();
                        $type_a_day  += AttendanceLine::where('attendance_id', $att_row->attendance_id)->where([['student_id', $stu_row->student_id], ['attendance_type_id', '4']])->count();
                    }

                    if ($type_a_day > 0 || $type_pm_day > 0) {
                        if ($type_a_day > 0) {
                            $type_a++;
                        }
                        if ($type_pm_day > 0) {
                            $type_pm++;
                        }
                        $fake_attendance = 'attendance_' . $date->format('Y-m-d');
                        $stu_row[$fake_attendance] = 1;
                    } else {
                        $fake_attendance = 'attendance_' . $date->format('Y-m-d');
                        $stu_row[$fake_attendance] = null;
                    }
                } else {
                    $fake_attendance = 'attendance_' . $date->format('Y-m-d');
                    $stu_row[$fake_attendance] = null;
                }
            }
            // $stu_row['total_type_ps'] = $type_ps;
            $stu_row['total_type_pm'] = $type_pm;
            // $stu_row['total_type_al'] = $type_al;
            $stu_row['total_type_a']  = $type_a;
        }
        $response = [
            'dates' => $dates,
            'attendance' => $attendance,
            'day_number_of_month' => $day_number_of_month,
            'student' => $student,
            'classData' => $classData,
        ];
        return  response($response, 200);
    }
}
