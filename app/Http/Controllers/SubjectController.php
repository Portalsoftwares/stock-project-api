<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;
use App\Models\SubjectGradeLevel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Subject::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'subject_name_kh';
        if ($per_page == -1) {
            $per_page = DB::table('subjects')->count() > 0 ? DB::table('subjects')->count() : $per_page;
        }

        // if (!empty($request->filter_profession)) {
        //     $items->whereIn('profession', 'like', $request->filter_profession);
        // }
        // if (!empty($request->filter_teacher_level)) {
        //     $items->whereIn('teacher_level', $request->filter_teacher_level);
        // }

        if (!empty($request->search)) {
            $items->where('subject_name_kh', 'like', "%" . $request->search . "%");
            $items->orWhere('subject_name_en', 'like', "%" . $request->search . "%");
            $items->orWhere('subject_sort_name_en', 'like', "%" . $request->search . "%");
        }
        if (!empty($request->is_show_trust)) {
            $items->onlyTrashed();
        }
        $data = $items
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);
        $response = [
            'data' => $data,
        ];
        return  response($response, 200);
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_name_kh' => 'required|string',
            'subject_name_en' => 'required|string',
            'subject_sort_name_en' => 'required|string',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new Subject();
            $items->fill($validator->validated());
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $items = Subject::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }


    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'subject_name_kh' => 'required|string',
            'subject_name_en' => 'required|string',
            'subject_sort_name_en' => 'required|string',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = Subject::find($id);
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
            $items = Subject::find($id)->delete();
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }



    // Subject Grade Level  

    public function getSubjectLevel(Request $request)
    {
        $items =  SubjectGradeLevel::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'subject_grade_id';
        if ($per_page == -1) {
            $per_page = DB::table('subjects_grade_level')->count() > 0 ? DB::table('subjects_grade_level')->count() : $per_page;
        }

        // if (!empty($request->filter_profession)) {
        //     $items->whereIn('profession', 'like', $request->filter_profession);
        // }
        // if (!empty($request->filter_teacher_level)) {
        //     $items->whereIn('teacher_level', $request->filter_teacher_level);
        // }

        if (!empty($request->search)) {
            // $items->where('subject_name_kh', 'like', "%" . $request->search . "%");
            // $items->orWhere('subject_name_en', 'like', "%" . $request->search . "%");
            // $items->orWhere('subject_sort_name_en', 'like', "%" . $request->search . "%");
        }
        if (!empty($request->is_show_trust)) {
            $items->onlyTrashed();
        }
        $data = $items->with(['subject', 'grade_level', 'class_type'])
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);
        $response = [
            'data' => $data,
        ];
        return  response($response, 200);
    }

    public function createSubjectLevel(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject_grade_id' => 'required',
            'grade_level_id' => 'required',
            'subject_id' => 'required',
            'class_type_id' => 'required',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new SubjectGradeLevel();
            $items->fill($validator->validated());
            $items->full_score = $request->full_score;
            $items->divide = $request->divide;
            $items->average = $request->average;
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function editSubjectLevel($id)
    {
        $items = SubjectGradeLevel::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }


    public function updateSubjectLevel(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'subject_grade_id' => 'required',
            'grade_level_id' => 'required',
            'subject_id' => 'required',
            'class_type_id' => 'required',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = SubjectGradeLevel::find($id);
            $items->fill($validator->validated());
            $items->full_score = $request->full_score;
            $items->divide = $request->divide;
            $items->average = $request->average;
            $items->save();
        });

        $response = [
            'data' => 'Update successfull',
        ];
        return  response($response, 200);
    }

    public function deleteSubjectLevel($id)
    {
        DB::transaction(function () use ($id) {
            $items = SubjectGradeLevel::find($id)->delete();
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }
}
