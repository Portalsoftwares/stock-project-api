<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Academic;
use App\Models\Permission;
use App\Models\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use PhpParser\Node\Expr\Cast\Array_;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Role::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'id';
        if ($per_page == -1) {
            $per_page = DB::table('roles')->count() > 0 ? DB::table('roles')->count() : $per_page;
        }

        $items =  Role::where(function ($query) use ($request) {
            if (!empty($request->search)) {
                $query->where('name', 'like', "%" . $request->search . "%");
            }
        });

        $data = $items
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);
        foreach ($data as $key => $value) {
            # code...
            $value->date = $value->created_at->diffForHumans();
        }
        $response = [
            'data' => $data,
        ];
        return  response($response, 200);
    }
    public function getPermissions(Request $request)
    {
        $permissions = Permission::all();
        $response = [
            'data' => $permissions,
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
