<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\StudentClass;
use App\Models\ScoreType;
use App\Models\Score;
use App\Models\scoreLine;
use App\Models\SubjectGradeLevel;
use App\Models\TeacherClass;
use Carbon\Carbon;

class ScoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id)
    {
        $class_id = $id;
        $subject_grade_id = $request->subject_grade_id;
        $score_type_id = $request->score_type_id;
        $student = StudentClass::query()->where('class_id', $id)->with(['student_in_class.gender', 'student_in_class.status',])->get();
        $score = Score::where(function ($query) use ($class_id, $subject_grade_id, $score_type_id) {
            $query->where('class_id', $class_id)->where('score_type_id', $score_type_id)->where('subject_grade_id', $subject_grade_id);
        })->first();
        $scoreLine = null;
        if ($score) {
            $scoreLine = scoreLine::where('score_id', $score->score_id)->get();
        }
        $scoreType = scoreType::all();
        foreach ($student as $index => $data) {
            // បាន​ហៅ វត្តមានហើយ
            if (!empty($score) && !$scoreLine->isEmpty()) {
                if ($data->student_id == $scoreLine[$index]->student_id) {
                    $data['mark'] =  $scoreLine[$index]->mark;
                }
            } else {
                // មិនទាន់
                $data['mark'] = 0.0;
            }
        }
        $response = [
            'student' => $student,
            'score_type' => $scoreType,
        ];
        return  response($response, 200);
    }

    public function allsubeject(Request $request, $id)
    {
        $class_id = $id;
        $scoreLine = null;
        $scoreType = scoreType::all();
        $score_type_id = $request->score_type_id;
        $subjectGradeInclass = TeacherClass::where('class_id', $id)->with('teacher_subject_in_class.subject')->get();
        $student = StudentClass::query()->where('class_id', $id)->with(['student_in_class.gender', 'student_in_class.status',])->get();
        foreach ($student as  $data) {
            foreach ($subjectGradeInclass as $obj) {
                $score = Score::where([['class_id', $class_id], ['score_type_id', $score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                if (!empty($score)) {
                    $scoreLine = scoreLine::where([['score_id', $score->score_id], ['student_id', $data->student_id]])->first();
                }
                // បានស្រង់ហើយ
                if (!empty($scoreLine)) {
                    $data['mark_' . $obj->teacher_subject_in_class->subject_grade_id] =  $scoreLine->mark;
                } else {
                    // មិនទាន់
                    $data['mark_' . $obj->teacher_subject_in_class->subject_grade_id] = 0.0;
                }
            }
        }
        $response = [
            'student' => $student,
            'score_type' => $scoreType,
        ];
        return  response($response, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createAllSubject(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'class_id' => ['required', 'exists:class,class_id'],
            'score_type_id' => ['required', 'exists:score_type,score_type_id'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }

        DB::transaction(function () use ($request) {
            //Create
            $subjectGradeInclass = TeacherClass::where('class_id', $request->class_id)->with('teacher_subject_in_class.subject')->get();
            $student = $request->data;
            foreach ($student as  $data) {
                foreach ($subjectGradeInclass as $obj) {
                    $score = Score::where([['class_id', $request->class_id], ['score_type_id', $request->score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                    if (empty($score)) {
                        $score = Score::create([
                            'class_id' => $request->class_id,
                            'score_type_id' => $request->score_type_id,
                            'subject_grade_id' => $obj->teacher_subject_in_class->subject_grade_id
                        ]);
                        $scoreLine[] = ['score_id' => $score->score_id, 'student_id' => $data['student_id'], 'mark' => $data['mark_' . $obj->teacher_subject_in_class->subject_grade_id]];
                    } else {
                        scoreLine::where('score_id', $score->score_id)->delete();
                        $scoreLine[] = ['score_id' => $score->score_id, 'student_id' => $data['student_id'], 'mark' => $data['mark_' . $obj->teacher_subject_in_class->subject_grade_id]];
                    }
                }
                scoreLine::insert($scoreLine);
            }
        });
        $response = [
            'message' => 'success',
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
        $validator = Validator::make($request->all(), [
            'class_id' => ['required', 'exists:class,class_id'],
            'score_type_id' => ['required', 'exists:score_type,score_type_id'],
            'subject_grade_id' => ['required', 'exists:subject_grade_level,subject_grade_id'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }

        DB::transaction(function () use ($request) {
            $score = Score::where(function ($query) use ($request) {
                $query->where('class_id', $request->class_id)->where('score_type_id', $request->score_type_id)->where('subject_grade_id', $request->subject_grade_id);
            })->first();
            //Create
            if (!$score) {
                $score = Score::create([
                    'class_id' => $request->class_id,
                    'score_type_id' => $request->score_type_id,
                    'subject_grade_id' => $request->subject_grade_id
                ]);
            } else {
                scoreLine::where('score_id', $score->score_id)->delete();
            }
            $data = $request->data ?? [];
            $scoreLine = [];
            if (isset($score)) {
                foreach ($data as $row) {
                    $obj = [
                        'score_id' => $score->score_id,
                        'student_id' => $row['student_id'],
                        'mark' => $row['mark'],
                    ];
                    array_push($scoreLine, $obj);
                }
                //Insert scoreLine 
                scoreLine::insert($scoreLine);
            }
        });
        $response = [
            'message' => 'success',
        ];
        return  response($response, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $id)
    {
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
