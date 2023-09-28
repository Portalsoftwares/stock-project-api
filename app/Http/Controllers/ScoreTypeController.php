<?php

namespace App\Http\Controllers;

use App\Models\Academic;
use App\Models\score;
use Illuminate\Http\Request;
use App\Models\ScoreType;
use App\Models\scoreTypeAcademic;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;


class ScoreTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'score_type_id';
        if ($per_page == -1) {
            $per_page = DB::table('score_type')->count() > 0 ? DB::table('score_type')->count() : $per_page;
        }

        if (!empty($request->is_show_trust)) {
            $items =  ScoreType::onlyTrashed()->where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->where('name', 'like', "%" . $request->search . "%");
                }
            });
        } else {
            $items =  ScoreType::where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->where('name', 'like', "%" . $request->search . "%");
                }
            });
        }


        $data = $items->whereNotIn('type', [3, 4])
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
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new ScoreType();
            $items->fill($validator->validated());
            $items->date = $request->date ?? '0000-00-00';
            $items->type = $request->type;
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function restore($id)
    {
        $items = ScoreType::withTrashed()->where('score_type_id', $id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $items = ScoreType::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string'
        ]);
        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = ScoreType::find($id);
            $items->fill($validator->validated());
            $items->date = $request->date;
            $items->type = $request->type;
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
            $items = ScoreType::find($id);
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = ScoreType::onlyTrashed()->where('score_type_id', $id);
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


    //For Academic

    public function indexAcademic(Request $request)
    {
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'id';
        if ($per_page == -1) {
            $per_page = DB::table('score_type_academic')->count() > 0 ? DB::table('score_type_academic')->count() : $per_page;
        }

        if (!empty($request->is_show_trust)) {
            $items =  scoreTypeAcademic::onlyTrashed()->where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    // $query->where('name', 'like', "%" . $request->search . "%");
                }
            });
        } else {
            $items =  scoreTypeAcademic::where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    // $query->where('name', 'like', "%" . $request->search . "%");
                }
            });
        }
        $data = $items->with('academic', 'semester')
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);
        $academic = Academic::all();
        $semester = ScoreType::where('type', 3)->get();
        $months = ScoreType::whereIn('type', [1, 2])->get();
        $response = [
            'data' => $data,
            'academic' => $academic,
            'semester' => $semester,
            'months' => $months,
        ];
        return  response($response, 200);
    }

    public function createAcademic(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'academic_id' => [
                'required',
                Rule::unique('score_type_academic')->where(function ($query) use ($request) {
                    return $query->where('academic_id', $request->academic_id)->where('semester_id', $request->semester_id)->get();
                })
            ],
            'semester_id' => [
                'required',
                Rule::unique('score_type_academic')->where(function ($query) use ($request) {
                    return $query->where('academic_id', $request->academic_id)->where('semester_id', $request->semester_id)->get();
                })
            ]
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new scoreTypeAcademic();
            $items->fill($validator->validated());
            $items->under_score_type_id = $request->under_score_type_id;
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function restoreAcademic($id)
    {
        $items = scoreTypeAcademic::withTrashed()->where('id', $id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }

    public function editAcademic($id)
    {
        $items = scoreTypeAcademic::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function updateAcademic(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'academic_id' => 'required',
            'semester_id' => 'required',
        ]);
        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = scoreTypeAcademic::find($id);
            $items->fill($validator->validated());
            $items->under_score_type_id = $request->under_score_type_id;
            $items->save();
        });

        $response = [
            'data' => 'Update successfull',
        ];
        return  response($response, 200);
    }

    public function deleteAcademic($id)
    {
        DB::transaction(function () use ($id) {
            //Delete soft
            $items = scoreTypeAcademic::find($id);
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = scoreTypeAcademic::onlyTrashed()->where('id', $id);
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
