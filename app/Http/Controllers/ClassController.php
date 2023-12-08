<?php

namespace App\Http\Controllers;

use App\Exports\ClassStudentExport;
use App\Models\Academic;
use App\Models\Attendance;
use App\Models\AttendanceLine;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\Classes;
use App\Models\ClassType;
use App\Models\TeacherClass;
use App\Models\StudentClass;
use App\Models\Schedule;

use App\Models\Gender;
use App\Models\GradeLevel;
use App\Models\score;
use App\Models\scoreLine;
use App\Models\Student;
use App\Models\StudentRole;
use App\Models\StudentStatus;
use App\mPDF\PdfWrapper;
use App\mPDF\PdfWrapper as PDF;
use App\Exports\ClassExport;
use Maatwebsite\Excel\Facades\Excel;
use Auth;

class ClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Classes::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'class_name';

        //Teacher class
        $teacher_role_id = Auth::user()->roles[0]->id;
        $teacher_id = null;
        $teacherClass =[];
        $is_teacher = false;
        if($teacher_role_id == 4){
            $is_teacher = true;
            $teacher_id = Auth::user()->teacher_id;
            $teacherClass = TeacherClass::where('teacher_id', $teacher_id)->pluck('class_id');
        }

        if($is_teacher){
            if ($per_page == -1) {
                $per_page = DB::table('class')->whereIn('class_id',$teacherClass)->count() > 0 ? DB::table('class')->whereIn('class_id',$teacherClass)->count() : $per_page;
            }
        }else{
            if ($per_page == -1) {
                $per_page = DB::table('class')->count() > 0 ? DB::table('class')->count() : $per_page;
            }
        }

        if (!empty($request->class_type)) {
            $items->whereHas('class_type', function ($query) use ($request) {
                $query->whereIn('class_type_id', explode(',', $request->class_type));
            });
        }
        if (!empty($request->grade_level)) {
            $items->whereHas('grade_level', function ($query) use ($request) {
                $query->whereIn('grade_level_id', explode(',', $request->grade_level));
            });
        }
        if (!empty($request->academic)) {
            $items->whereHas('academic', function ($query) use ($request) {
                $query->where('academic_id', $request->academic);
            });
        }
        // if (!empty($request->filter_teacher_level)) {
        //     $items->whereIn('teacher_level', $request->filter_teacher_level);
        // }
        if($is_teacher){
            $items->whereIn('class_id', $teacherClass);
        }

        if (!empty($request->search)) {
            // $items->where('subject_name_kh', 'like', "%" . $request->search . "%");
            // $items->orWhere('subject_name_en', 'like', "%" . $request->search . "%");
            // $items->orWhere('subject_sort_name_en', 'like', "%" . $request->search . "%");
        }
        if (!empty($request->is_show_trust)) {
            $items->onlyTrashed();
        }


        $data = $items->with([
            'class_type', 'academic', 'count_student_in_class.student_in_class', 'get_teacher_in_class.teacher_in_class', 'get_teacher_in_class.teacher_subject_in_class'
        ])
            
            ->orderBy('academic_id', 'DESC')
            ->paginate($per_page);
        $response = [
            'data' => $data,
            'grade_level' => GradeLevel::all(),
            'academic' => Academic::all(),
            'class_type' => ClassType::all(),
        ];
        return  response($response, 200);
    }

    public function getTeacher(Request  $request, $id)
    {
        $teacher = TeacherClass::where('class_id', $id)->with(['teacher_subject_in_class.subject', 'teacher_in_class.profile_img'])->get();
        $class = Classes::where('class_id', $id)->first();

        $teacher_id = false;
        $is_teacher = false;
        $teacherSubject = [];
        $is_teacher_manager = false;
        $teacher_role_id = Auth::user()->roles[0]->id;
        if($teacher_role_id == 4){
            $is_teacher = true;
            $teacher_id = Auth::user()->teacher_id;
            $teacherSubject = TeacherClass::where([['teacher_id', $teacher_id], ['class_id', $id]])->pluck('subject_grade_id');
            $isManager =  TeacherClass::where([['teacher_id', $teacher_id], ['class_id', $id],['role_id', 1]])->count();
            $is_teacher_manager = $isManager >0 ? true : false;
        }else{
            $is_teacher_manager = true;
        }

        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'student_id';

        if ($per_page == -1) {
            $per_page = DB::table('student_class')->where('class_id', $id)->count() > 0 ? DB::table('student_class')->where('class_id', $id)->count() : $per_page;
        }

        $student = StudentClass::where('class_id', $id)->with(['student_in_class.profile_img', 'student_in_class.status', 'student_in_class.gender'])
            ->whereHas('student_in_class', function ($query) use ($request) {

                if (!empty($request->search)) {
                    $query->where(function ($query) use ($request) {
                        $query->Where('sid', 'like', "%" . $request->search . "%");
                        $query->orWhere('full_name_kh', 'like', "%" . $request->search . "%");
                        $query->orWhere('full_name_en', 'like', "%" . $request->search . "%");
                        $query->orWhere('email', 'like', "%" . $request->search . "%");
                        $query->orWhere('phone', 'like', "%" . $request->search . "%");
                    });
                }
            })
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);

        $status = StudentStatus::all();
        $role = StudentRole::all();
        $gender = Gender::all();
        $response = [
            'teacher' => $teacher,
            'student' => $student,
            'class' => $class,
            'status' => $status,
            'role' => $role,
            'gender' => $gender,
            'teacher_subject_id' => $teacherSubject,
            'teacher_id' => $teacher_id,
            'is_teacher_manager' => $is_teacher_manager,

        ];
        return  response($response, 200);
    }
    public function create(Request  $request)
    {
        $validator = Validator::make($request->all(), [
            'class_name' => [
                'required',
                Rule::unique('class')->where(function ($query) use ($request) {
                    return $query->where('class_name', $request->class_name)->where('academic_id', $request->academic_id)->get();
                })
            ],
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

        DB::transaction(function () use ($validator, $request) {
            $class = new Classes();
            $class->fill($validator->validated());
            $class->other = $request->other;
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
            'class_name' => [
                'required'

            ],
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
        DB::transaction(function () use ($validator, $request, $id) {
            $items = Classes::find($id);
            $items->fill($validator->validated());
            $items->other = $request->other;
            $items->save();
        });

        $response = [
            'data' => 'Update successfull',
        ];
        return  response($response, 200);
    }


    public function delete($id)
    {
        $studentClass = StudentClass::where('class_id',$id)->count();
        $teacherClass = TeacherClass::where('class_id',$id)->count();
        if($studentClass>0 || $teacherClass>0){
            $response = [
                'data' => 'ទិន្នន័យមិនអាចលុបបានទេ​ ព្រោះមានទំនាក់ទំនងជាមួយទិន្នន័យដទែទៀត',
            ];
            return  response($response, 400);
        }
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

    public function restore($id)
    {
        $items = Classes::withTrashed()->where('class_id', $id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }


    //Add student in class

    public function addStudentClass(Request $request, $id)
    {
        $dataStudent = [];

        foreach ($request->data as $data) {
            $obj = [
                'student_id' => $data['student_id'],
                'class_id' => $id
            ];
            array_push($dataStudent, $obj);
        };
        $classStudent = StudentClass::Insert($dataStudent);
        $response = [
            'data' => 'add student in class successfull',
        ];
        return  response($response, 200);
    }

    public function getStudentToClass(Request $request, $id)
    {
        $class = Classes::find($id);
        $class_type_id =  $class->class_type_id;
        $grade_level_id =  $class->grade_level_id;
        $academic_id =  $class->academic_id;
        $all_class_academic = Classes::where('academic_id',$academic_id)->pluck('class_id');
        //array student in class
        $studentClass = StudentClass::whereIn('class_id', $all_class_academic)->pluck('student_id');
        $allStudentData = Student::whereNotIn('student_id', $studentClass)
        ->where(function ($query) use ($request) {
            if (!empty($request->search)) {
                $query->Where('sid', 'like', "%" . $request->search . "%");
                $query->orWhere('full_name_kh', 'like', "%" . $request->search . "%");
                $query->orWhere('full_name_en', 'like', "%" . $request->search . "%");
                $query->orWhere('email', 'like', "%" . $request->search . "%");
                $query->orWhere('phone', 'like', "%" . $request->search . "%");
            }
        })
        ->with('profile_img', 'status', 'gender')->get();
        $response = [
            'data' => $allStudentData
        ];
        return  response($response, 200);
    }
    public function deleteStudentToClass($id, $student_id)
    {
        $attendace = Attendance::where('class_id', $id)->pluck('attendance_id');
        $studentAttendance = AttendanceLine::whereIn('attendance_id', $attendace)->where('student_id',$student_id)->count();

        $score = score::where('class_id', $id)->pluck('score_id');
        $studentScore = scoreLine::whereIn('score_id',$score)->where('student_id',$student_id)->count();
        if($studentAttendance>0 || $studentScore>0){
            $response = [
                'data' => 'ទិន្នន័យមិនអាចលុបបានទេ​ ព្រោះមានទំនាក់ទំនងជាមួយទិន្នន័យដទែទៀត',
            ];
            return  response($response, 400);
        }
        $stuClass = StudentClass::find($student_id)->delete();
        if ($stuClass) {

            $response = [
                'data' => 'Remove student in class successfull',
            ];
            return  response($response, 200);
        } else {

            $response = [
                'data' => 'Remove student in class error',
            ];
            return  response($response, 402);
        }
    }


    public function exportStudentListPDF(Request $request, $id)
    {

        $class = Classes::with('academic')->find($id);

        $student = StudentClass::where('class_id', $id)->with(['student_in_class.profile_img', 'student_in_class.status', 'student_in_class.gender'])->get();

        $pdf = PdfWrapper::loadView('ClassStudent.list', [
            'students' => $student,
            'class' => $class
        ]);

        return $pdf->stream('students-list.pdf');
    }

    public function exportStudentListExcel(Request $request, $id)
    {
        return Excel::download(new ClassStudentExport($id), 'class-student-list.xlsx');
    }


    
    public function exportExcel(Request $request)
    {
        if (isset($request->is_show_trust)) {
            return Excel::download(new ClassExport($request->is_show_trust), 'class.xlsx');
        }
        return Excel::download(new ClassExport(), 'class.xlsx');
    }

    public function exportPDF(Request $request)
    {
        $items = Classes::query();

        if ($request->has('is_show_trust') && $request->is_show_trust) {
            $items = Classes::onlyTrashed();
        }

        $pdf = PDF::loadView('list.class', ['classes' => $items->with(['class_type', 'academic', 'count_student_in_class.student_in_class', 'get_teacher_in_class.teacher_in_class'])->get()]);
        return $pdf->stream('class.pdf');
    }
}
