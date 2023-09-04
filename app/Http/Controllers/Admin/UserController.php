<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  User::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'id';
        if ($per_page == -1) {
            $per_page = DB::table('users')->count() > 0 ? DB::table('users')->count() : $per_page;
        }

        if (!empty($request->search)) {
            $items->orWhere('name', 'like', "%" . $request->search . "%");
            $items->orWhere('email', 'like', "%" . $request->search . "%");
            $items->orWhere('phone', 'like', "%" . $request->search . "%");
        }
        if (!empty($request->is_show_trust)) {
            $items->onlyTrashed();
        }
        $data = $items->with('roles', 'img')
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);

        $response = [
            'data' => $data,
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
        $response = [
            'roles' => Role::all()
        ];
        return  response($response, 201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'unique:users'],
            'photo_id' => ['required'],
            'email' => ['required', 'email', 'unique:users'],
            'password' => ['required', Rules\Password::defaults()],
            'role' => 'required',
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 201);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'file_upload_id' => $request->photo_id,
            'password' => Hash::make($request->password),
        ]);
        $rolesArray =   explode(',', $request->role);

        foreach ($rolesArray as $row) {
            $user->assignRole($row);
        }

        $response = [
            'user' => $user,
            'message' => "User created."
        ];
        return  response($response, 201);
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
        $user = User::where('id', $id)->with('img')->first();
        // dd( Hash::check('123a456789', $user->password, []));

        if (is_null($user)) {
            $response = [
                'message' => 'user not found',
            ];
            return  response($response, 404);
        }
        $roles = Role::all();
        $response = [
            'user' => $user,
            'user_has_roles' => $user->roles->pluck("name"),
            'roles' => $roles
        ];
        return  response($response, 201);
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
        $user = User::where('id', $request->id)->first();

        if (is_null($request)) {
            abort(404);
        }

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'file_upload_id' => $request->photo_id,
        ]);
        // Delete all user roles
        DB::table('model_has_roles')->where('model_id', $request->id)->delete();
        $rolesArray =   explode(',', $request->role);

        foreach ($rolesArray as $row) {
            $user->assignRole($row);
        }
        $response = [
            'user' => $user,
            'message' => "User updated."
        ];
        return  response($response, 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        if ($id  == Auth::user()->id) {
            abort(404);
        }

        DB::transaction(function () use ($id) {
            //Delete soft
            $items = User::find($id);
            if (!empty($items)) {
                $items->delete();
            }
            //Hard Delete
            if (empty($items)) {
                $items = User::onlyTrashed()->find($id);
                if (!empty($items)) {
                    $items->forceDelete();
                }
                abort(404);
            }
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }
}
