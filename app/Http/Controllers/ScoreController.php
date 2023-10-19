<?php

namespace App\Http\Controllers;

use App\Exports\ReportScoreExport;
use App\Models\Academic;
use App\Models\Classes;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\StudentClass;
use App\Models\ScoreType;
use App\Models\Score;
use App\Models\scoreLine;
use App\Models\scoreTypeAcademic;
use App\Models\SubjectGradeLevel;
use App\Models\TeacherClass;
use Carbon\Carbon;
use App\mPDF\PdfWrapper as PDF;
use Maatwebsite\Excel\Facades\Excel;

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

        $is_random = $request->is_random  ?? 0;
        //យកតែការប្រលង 

        $class = Classes::find($id);
        $academic = $class->academic_id;
        $scoreTypeAcademic = scoreTypeAcademic::where('academic_id', $academic)->get();
        $under_score_type = [];
        foreach ($scoreTypeAcademic as $data) {
            $under_score_type = array_merge($under_score_type, explode(',', $data->under_score_type_id));
        }
        //បន្ថែម
        $scoreTypeAdd = scoreType::whereIn('type', [2])->pluck('score_type_id')->toArray();
        $under_score_type = array_merge($under_score_type, $scoreTypeAdd);
        $scoreType = scoreType::whereIn('score_type_id', $under_score_type)->get();

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
                    if ($is_random != 0) {
                        $data['mark_' . $obj->teacher_subject_in_class->subject_grade_id] = $this->randomScore($obj->teacher_subject_in_class->average, $obj->teacher_subject_in_class->full_score);
                    }
                }
            }
        }
        $response = [
            'student' => $student,
            'score_type' => $scoreType,
        ];
        return  response($response, 200);
    }

    public function randomScore($min, $max)
    {
        return rand($min, $max);
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

    public function getRankText($avg)
    {
        if ($avg >= 40) {
            return 'ល្អ';
        }
        if ($avg < 40 && $avg >= 32.5) {
            return 'ល្អបង្គួរ';
        }
        if ($avg < 32.5 && $avg >= 25) {
            return 'មធ្យម';
        }
        if ($avg < 25 && $avg > 0) {
            return 'ខ្សោយ';
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function reportSubject(Request $request, $id)
    {
        $class_id = $id;
        $scoreLine = null;

        $class = Classes::find($id);
        $academic = $class->academic_id;
        $academicObj = Academic::find($academic);
        $scoreTypeAcademic = scoreTypeAcademic::where('academic_id', $academic)->get();
        $under_score_type = [];
        foreach ($scoreTypeAcademic as $data) {
            $under_score_type = array_merge($under_score_type, explode(',', $data->under_score_type_id));
        }

        $scoreTypeAdd = scoreType::whereIn('type', [2, 3, 4])->pluck('score_type_id')->toArray();
        $under_score_type = array_merge($under_score_type, $scoreTypeAdd);
        $scoreType = scoreType::whereIn('score_type_id', $under_score_type)->get();
        $score_type_id = ScoreType::where('score_type_id', $request->score_type_id)->first();

        $subjectGradeInclass = TeacherClass::where('class_id', $id)->with('teacher_subject_in_class.subject')->get();
        $student = StudentClass::query()->where('class_id', $id)->with(['student_in_class.gender', 'student_in_class.status',])->get();
        //find women

        //Find divide total by subject , 50 pt = 1x 
        $total_divide = 0;
        foreach ($subjectGradeInclass as $obj) {
            $total_divide += $obj->teacher_subject_in_class->divide;
        }
        if ($total_divide == 0) {
            $total_divide = 1;
        }
        $arrayScore = [];
        //Data More Infor
        $total_student = count($student);
        $total_good = 0;
        $total_ok = 0;
        $total_medium = 0;
        $total_low = 0;
        $total_less = 0;
        $total_student_women = 0;
        $total_good_women = 0;
        $total_ok_women = 0;
        $total_medium_women = 0;
        $total_low_women = 0;
        $total_less_women = 0;

        //ប្រចាំខែ
        if ($score_type_id->type == 1 || $score_type_id->type == 2) {
            foreach ($student as  $data) {
                $total_score = 0;
                foreach ($subjectGradeInclass as $obj) {
                    $score = Score::where([['class_id', $class_id], ['score_type_id', $score_type_id->score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                    if (!empty($score)) {
                        $scoreLine = scoreLine::where([['score_id', $score->score_id], ['student_id', $data->student_id]])->first();
                        // បានស្រង់ហើយ
                        if (!empty($scoreLine)) {
                            //ក្រៅពីភាសាបរទេស
                            if ($obj->teacher_subject_in_class->divide != 0) {
                                $total_score +=  $scoreLine->mark;
                            }
                            //ភាសាបរទេស
                            if ($obj->teacher_subject_in_class->divide == 0) {
                                $total_score +=  $scoreLine->mark - 25;
                            }
                        }
                    }
                }
                $total_score  = $total_score;
                $avg_score = number_format($total_score / $total_divide, 2, '.');

                $data['mark_total'] = $total_score;
                $data['mark_avg'] = $avg_score;

                $women = $data->student_in_class->gender_id == 2;
                if ($women) {
                    $total_student_women++;
                }
                if ($avg_score != 0) {
                    $data['mark_rank_text'] = $this->getRankText($avg_score);
                    // return 'ល្អ';
                    if ($avg_score >= 40) {
                        $total_good++;
                        if ($women) {
                            $total_good_women++;
                        }
                    }
                    // return 'ល្អបង្គួរ';
                    if ($avg_score < 40 && $avg_score >= 32.5) {
                        $total_ok++;
                        if ($women) {
                            $total_ok_women++;
                        }
                    }
                    // return 'មធ្យម';
                    if ($avg_score < 32.5 && $avg_score >= 25) {
                        $total_medium++;
                        if ($women) {
                            $total_medium_women++;
                        }
                    }
                    // return 'ខ្សោយ';
                    if ($avg_score < 25 && $avg_score > 0) {
                        $total_low++;
                        if ($women) {
                            $total_low_women++;
                        }
                    }
                    if ($avg_score <= 0) {
                        $total_less++;
                        if ($women) {
                            $total_less_women++;
                        }
                    }
                } else {
                    $data['mark_rank_text'] = null;
                }
            }
        }
        //ប្រចាំឆមាស 
        if ($score_type_id->type == 3) {
            //avg total in semester month + avg exam semseter
            $monthInSemester = scoreTypeAcademic::where([['academic_id', $academic], ['semester_id', $score_type_id->score_type_id]])->first();
            $monnthly = explode(',', $monthInSemester->under_score_type_id);
            //យកទាំងប្រលងប្រចាំខែ និង​ឆមាស
            $dataMonthly = scoreType::whereIn('score_type_id', $monnthly)->get();
            //យកតែប្រលងប្រចាំខែមក
            $number_monthly = scoreType::whereIn('score_type_id', $monnthly)->where('type', 1)->count();
            // $number_monthly = count($dataMonthly);
            //ប្រចាំខែ រកមធ្យមភាគ
            foreach ($student as  $data) {
                $final_avg_semester = 0;
                //toal 1 month

                $total_avg_monthly = 0;
                $total_avg_semester = 0;

                $total_score_monthly = 0;
                $total_score_semester = 0;
                $scoreIn = [];
                foreach ($dataMonthly as $mon) {

                    if ($mon->type == 1) {
                        foreach ($subjectGradeInclass as $obj) {
                            $score = Score::where([['class_id', $class_id], ['score_type_id', $mon->score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                            if (!empty($score)) {
                                $scoreLine = scoreLine::where([['score_id', $score->score_id], ['student_id', $data->student_id]])->first();
                                // បានស្រង់ហើយ
                                if (!empty($scoreLine)) {
                                    //ក្រៅពីភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide != 0) {
                                        $total_score_monthly +=  $scoreLine->mark;
                                    }
                                    //ភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide == 0) {
                                        $total_score_monthly +=  $scoreLine->mark - 25;
                                    }
                                }
                            }
                        }
                    }

                    if ($mon->type == 2) {

                        foreach ($subjectGradeInclass as $obj) {
                            $score = Score::where([['class_id', $class_id], ['score_type_id', $mon->score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                            if (!empty($score)) {
                                $scoreLine = scoreLine::where([['score_id', $score->score_id], ['student_id', $data->student_id]])->first();
                                // បានស្រង់ហើយ
                                if (!empty($scoreLine)) {
                                    //ក្រៅពីភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide != 0) {
                                        $scoreIn[] = $scoreLine->mark;
                                        $total_score_semester +=  $scoreLine->mark;
                                    }
                                    //ភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide == 0) {
                                        $total_score_semester +=  $scoreLine->mark - 25;
                                    }
                                }
                            }
                        }
                    }
                }

                $total_avg_monthly = $total_score_monthly / $total_divide;
                $total_avg_monthly_semester = $total_avg_monthly / $number_monthly;

                $total_avg_semester = $total_score_semester / $total_divide;

                $final_avg_semester = ($total_avg_monthly_semester + $total_avg_semester) / 2;
                $data['mark_total'] = null;
                $data['mark_avg'] =  number_format($final_avg_semester, 2, '.');

                $women = $data->student_in_class->gender_id == 2;
                if ($women) {
                    $total_student_women++;
                }
                if ($final_avg_semester != 0) {
                    $data['mark_rank_text'] = $this->getRankText($final_avg_semester);
                    // return 'ល្អ';
                    if ($final_avg_semester >= 40) {
                        $total_good++;
                        if ($women) {
                            $total_good_women++;
                        }
                    }
                    // return 'ល្អបង្គួរ';
                    if ($final_avg_semester < 40 && $final_avg_semester >= 32.5) {
                        $total_ok++;
                        if ($women) {
                            $total_ok_women++;
                        }
                    }
                    // return 'មធ្យម';
                    if ($final_avg_semester < 32.5 && $final_avg_semester >= 25) {
                        $total_medium++;
                        if ($women) {
                            $total_medium_women++;
                        }
                    }
                    // return 'ខ្សោយ';
                    if ($final_avg_semester < 25 && $final_avg_semester > 0) {
                        $total_low++;
                        if ($women) {
                            $total_low_women++;
                        }
                    }
                    if ($final_avg_semester <= 0) {
                        $total_less++;
                        if ($women) {
                            $total_less_women++;
                        }
                    }
                } else {
                    $data['mark_rank_text'] = null;
                }
            }
        }
        //ប្រចាំឆ្នាំ
        if ($score_type_id->type == 4) {
            //avg total in semester month + avg exam semseter
            $monthInSemester = scoreTypeAcademic::where('academic_id', $academic)->get();
            $monnthly = [];
            foreach ($scoreTypeAcademic as $data) {
                $monnthly = array_merge($monnthly, explode(',', $data->under_score_type_id));
            }
            //យកទាំងប្រលងប្រចាំខែ និង​ឆមាស
            $dataMonthly = scoreType::whereIn('score_type_id', $monnthly)->get();
            //យកតែប្រលងប្រចាំខែមក
            $number_monthly = scoreType::whereIn('score_type_id', $monnthly)->where('type', 1)->count();
            // $number_monthly = count($dataMonthly);
            //ប្រចាំខែ រកមធ្យមភាគ
            foreach ($student as  $data) {
                $final_avg_semester = 0;

                $total_avg_monthly = 0;
                $total_avg_semester = 0;

                $total_score_monthly = 0;
                $total_score_semester = 0;
                foreach ($dataMonthly as $mon) {

                    if ($mon->type == 1) {
                        foreach ($subjectGradeInclass as $obj) {
                            $score = Score::where([['class_id', $class_id], ['score_type_id', $mon->score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                            if (!empty($score)) {
                                $scoreLine = scoreLine::where([['score_id', $score->score_id], ['student_id', $data->student_id]])->first();
                                // បានស្រង់ហើយ
                                if (!empty($scoreLine)) {
                                    //ក្រៅពីភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide != 0) {
                                        $total_score_monthly +=  $scoreLine->mark;
                                    }
                                    //ភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide == 0) {
                                        $total_score_monthly +=  $scoreLine->mark - 25;
                                    }
                                }
                            }
                        }
                    }

                    if ($mon->type == 2) {

                        foreach ($subjectGradeInclass as $obj) {
                            $score = Score::where([['class_id', $class_id], ['score_type_id', $mon->score_type_id], ['subject_grade_id', $obj->teacher_subject_in_class->subject_grade_id]])->first();
                            if (!empty($score)) {
                                $scoreLine = scoreLine::where([['score_id', $score->score_id], ['student_id', $data->student_id]])->first();
                                // បានស្រង់ហើយ
                                if (!empty($scoreLine)) {
                                    //ក្រៅពីភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide != 0) {
                                        $scoreIn[] = $scoreLine->mark;
                                        $total_score_semester +=  $scoreLine->mark;
                                    }
                                    //ភាសាបរទេស
                                    if ($obj->teacher_subject_in_class->divide == 0) {
                                        $total_score_semester +=  $scoreLine->mark - 25;
                                    }
                                }
                            }
                        }
                    }
                }

                $total_avg_monthly = $total_score_monthly / $total_divide;
                $total_avg_monthly_semester = $total_avg_monthly / $number_monthly;

                $total_avg_semester = $total_score_semester / $total_divide;

                //Exam Semester
                $avg_score_yearly = number_format(($total_avg_semester / 2), 2, '.');

                $data['mark_total'] = 0;
                $data['mark_avg'] = $avg_score_yearly;

                $women = $data->student_in_class->gender_id == 2;
                if ($women) {
                    $total_student_women++;
                }
                if ($avg_score_yearly != 0) {
                    $data['mark_rank_text'] = $this->getRankText($avg_score_yearly);
                    // return 'ល្អ';
                    if ($avg_score_yearly >= 40) {
                        $total_good++;
                        if ($women) {
                            $total_good_women++;
                        }
                    }
                    // return 'ល្អបង្គួរ';
                    if ($avg_score_yearly < 40 && $avg_score_yearly >= 32.5) {
                        $total_ok++;
                        if ($women) {
                            $total_ok_women++;
                        }
                    }
                    // return 'មធ្យម';
                    if ($avg_score_yearly < 32.5 && $avg_score_yearly >= 25) {
                        $total_medium++;
                        if ($women) {
                            $total_medium_women++;
                        }
                    }
                    // return 'ខ្សោយ';
                    if ($avg_score_yearly < 25 && $avg_score_yearly > 0) {
                        $total_low++;
                        if ($women) {
                            $total_low_women++;
                        }
                    }
                    if ($avg_score_yearly <= 0) {
                        $total_less++;
                        if ($women) {
                            $total_less_women++;
                        }
                    }
                } else {
                    $data['mark_rank_text'] = null;
                }
            }
        }

        //Set grade of score
        $collection = collect($student);
        $collection = $collection->sortByDesc(
            function ($item) {
                return $item->mark_avg;
            }
        );
        $collection = $collection->values()->all();
        $rank = 1;
        $previous = null;
        $ix = 1;
        foreach ($collection as  $data) {
            if ($data['mark_avg'] != 0) {
                if ($previous && $previous['mark_avg'] != $data['mark_avg']) {
                    if ($ix > 1) {
                        $rank += $ix;
                    } else {
                        $rank++;
                    }
                }
                if ($previous &&  $previous['mark_avg'] == $data['mark_avg']) {
                    $ix++;
                } else {
                    $ix = 1;
                }

                $data['mark_rank'] = $rank;
                $previous = $data;
            }
        }
        $response = [
            'academic' =>  $academicObj,
            'exam' =>  $score_type_id,
            'student' =>  $collection,
            'score_type' => $scoreType,
            'total_student' => $total_student,
            'total_good' => $total_good,
            'total_ok' => $total_ok,
            'total_medium' => $total_medium,
            'total_low' => $total_low,
            'total_less' => $total_less,
            'total_student_women' => $total_student_women,
            'total_good_women' => $total_good_women,
            'total_ok_women' => $total_ok_women,
            'total_medium_women' => $total_medium_women,
            'total_low_women' => $total_low_women,
            'total_less_women' => $total_less_women,
        ];
        return  response($response, 200);
    }
    public function getExam($id)
    {
        $exam  = Score::where('class_id', $id)->with('score_type')->groupBy('score_type_id')->get();
        return  response([
            'data' => $exam
        ], 200);
    }
    //PDF EXPORT 
    public function exportPDF(Request $request)
    {
        //return "hi";
        $pdf = PDF::loadView('Score.monthly', [
            'data' => $request->data,
            'option' => $request->option,
        ]);
        // return $pdf;
        return $pdf->stream('score.pdf');
    }
    //EXCEL EXPORT 
    public function exportEXCEL(Request $request)
    {
        $data = $request->data;
        $option = $request->option;
        return Excel::download(new ReportScoreExport($data,  $option), 'score.xlsx');
    }
}
