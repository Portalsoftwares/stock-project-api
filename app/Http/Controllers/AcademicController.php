<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Academic;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class AcademicController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Academic::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'academic_name';
        if ($per_page == -1) {
            $per_page = DB::table('academic')->count() > 0 ? DB::table('academic')->count() : $per_page;
        }
        if (!empty($request->is_show_trust)) {
            $items =  Academic::onlyTrashed()->where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->where('academic_name', 'like', "%" . $request->search . "%");
                }
            });
        } else {
            $items =  Academic::where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->where('academic_name', 'like', "%" . $request->search . "%");
                }
            });
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
            'academic_name' => 'required|string',
            'start_date' => 'required',
            'end_date' => 'required'
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new Academic();
            $items->fill($validator->validated());
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function restore($id)
    {
        $items = Academic::withTrashed()->where('academic_id', $id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $items = Academic::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'academic_name' => 'required|string',
            'start_date' => 'required',
            'end_date' => 'required'
        ]);
        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = Academic::find($id);
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
            //Delete soft
            $items = Academic::find($id);
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = Academic::onlyTrashed()->where('academic_id', $id);
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
