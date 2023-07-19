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
            $query->where('class_id', $class_id)->where('score_type_id', $score_type_id);
        })->first();
        $scoreLine = [];
        if (!empty($score)) {
            $scoreLine = scoreLine::where('score_id', $score->score_id)->get();
        }

        $scoreType = scoreType::all();

        foreach ($student as $index => $data) {
            // បាន​ហៅ វត្តមានហើយ
            if (!empty($score)) {
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
            'score_type' => $scoreType
        ];
        return  response($response, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
