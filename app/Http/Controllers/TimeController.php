<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Time;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\Attendance;
use App\Models\ScheduleLine;


class TimeController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Time::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'name';
        if ($per_page == -1) {
            $per_page = DB::table('time')->count() > 0 ? DB::table('time')->count() : $per_page;
        }
        if (!empty($request->is_show_trust)) {
            $items =  Time::onlyTrashed()->where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->where('name', 'like', "%" . $request->search . "%");
                }
            });
        } else {
            $items =  Time::where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->where('name', 'like', "%" . $request->search . "%");
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
            'name' => 'required|string',
            'start_date' => 'required|unignu',
            'end_date' => 'required'
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new Time();
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
        $items = Time::withTrashed()->where('time_id', $id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $items = Time::find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
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
            $items = Time::find($id);
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

        $record_attendance = Attendance::where('time_id', $id)->count();
        $record_schedule = ScheduleLine::where('time_id', $id)->count();
        if($record_attendance>0 || $record_schedule>0 ){
            $response = [
                'data' => 'ទិន្នន័យមិនអាចលុបបានទេ​ ព្រោះមានទំនាក់ទំនងជាមួយទិន្នន័យដទែទៀត',
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($id) {
            //Delete soft
            $items = Time::find($id);
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = Time::onlyTrashed()->where('time_id', $id);
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
