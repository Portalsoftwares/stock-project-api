<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScoreType;
use Illuminate\Support\Facades\DB;
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
        $items =  ScoreType::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'score_type_id';
        if ($per_page == -1) {
            $per_page = DB::table('score_type')->count() > 0 ? DB::table('score_type')->count() : $per_page;
        }
        if (!empty($request->search)) {
            // $items->where('subject_name_kh', 'like', "%" . $request->search . "%");
            // $items->orWhere('subject_name_en', 'like', "%" . $request->search . "%");
            // $items->orWhere('subject_sort_name_en', 'like', "%" . $request->search . "%");
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
            $items->date = $request->date;
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
}
