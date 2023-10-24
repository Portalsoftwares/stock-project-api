<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Academic;
use App\Models\Permission;
use App\Models\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role as spatieRole;

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
        foreach($permissions as $perm){
            $perm['checked'] = false;
        }
        $response = [
            'data' => $permissions,
        ];
        return  response($response, 200);
    }
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role_name' => 'required|string',
            'permissions' => 'required',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        $permissions = collect($request->permissions);
        $rightPerm = $permissions->filter(function (array $item) {
            if($item['checked'] == true){
                return $item;
            }
        });
        $namePermission = $rightPerm->pluck('name')->toArray();
        // dd($namePermission);
        DB::transaction(function () use ($validator, $request, $namePermission ) {
            $role =  spatieRole::create([
                'name'=>$request->role_name,
                'guard_name'=>'web'
            ]);
            $role->givePermissionTo($namePermission);
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
        //All Permission
        $permissions = Permission::all();
        $Role = spatieRole::find($id);
        //Has Permission
        $RolePermissions = $Role->permissions;
        $collectionPermission = collect($RolePermissions)->pluck('id');
        $array_value = function ($id) use ($collectionPermission) {
            return in_array($id,$collectionPermission->toArray(), true); 
        };
        foreach($permissions as $perm){
            $perm['checked'] = $array_value($perm['id']);
        }
        $response = [
            'data' => $permissions,
            'role_name' => $Role,
        ];
        return  response($response, 200);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'role_name' => 'required|string',
            'permissions' => 'required',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        $permissions = collect($request->permissions);
        $rightPerm = $permissions->filter(function (array $item) {
            if($item['checked'] == true){
                return $item;
            }
        });
        $namePermission = $rightPerm->pluck('name')->toArray();
        // dd($namePermission);
        DB::transaction(function () use ($validator, $request, $id,$namePermission ) {
            $role =  spatieRole::find($id)->update([
                'name'=>$request->role_name,
                'guard_name'=>'web'
            ]);
            $role =  spatieRole::find($id);
            $role->syncPermissions([]);
            $role->givePermissionTo($namePermission);
        });

        $response = [
            'data' => ' Create successfull',
        ];
    }

    public function delete($id)
    {
        $items = spatieRole::find($id);
        if(count($items->users)>0){
            $response = [
                'data' => 'ទិន្នន័យមិនអាចលុបបានទេ​ ព្រោះមានទំនាក់ទំនងជាមួយទិន្នន័យដទែទៀត',
            ];
            return  response($response, 400);
            
        }

        DB::transaction(function () use ($id , $items) {
            //Delete soft
    
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = spatieRole::onlyTrashed()->find($id);
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
