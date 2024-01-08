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
use App\Models\Teacher;
use App\Exports\UsersExport;
use App\mPDF\PdfWrapper as PDF;
use Maatwebsite\Excel\Exporter;

class UserController extends Controller
{
    private $exporter;

    public function __construct(Exporter $exporter)
    {
        $this->exporter = $exporter;
    }


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
        if (!empty($request->is_show_trust)) {
            $items =  User::onlyTrashed()->where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->orWhere('name', 'like', "%" . $request->search . "%");
                    $query->orWhere('email', 'like', "%" . $request->search . "%");
                    $query->orWhere('phone', 'like', "%" . $request->search . "%");
                }
            });
        } else {
            $items =  User::where(function ($query) use ($request) {
                if (!empty($request->search)) {
                    $query->orWhere('name', 'like', "%" . $request->search . "%");
                    $query->orWhere('email', 'like', "%" . $request->search . "%");
                    $query->orWhere('phone', 'like', "%" . $request->search . "%");
                }
            });
        }
        $data = $items->with('roles', 'img', 'used')
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
        $unuser = User::whereNotNull('teacher_id')->pluck('teacher_id');

        $response = [
            'roles' => Role::all(),
            'teachers' => Teacher::whereNotIn('teacher_id', $unuser)->with('profile_img')->get()
        ];
        return  response($response, 200);
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
            'phone' => $request->phone,
            'email' => $request->email,
            'teacher_id' => $request->teacher_id ?? null,
            'file_upload_id' => $request->photo_id?? null,
            'password' => Hash::make($request->password),
        ]);
        // $rolesArray =   explode(',', $request->role);

        $user->assignRole($request->role);
        // foreach ($rolesArray as $row) {
        // }
        $teacher = Teacher::find($request->teacher_id);
        if (!empty($teacher)) {
            $teacher->update(['is_enable_account' => 1]);
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
        if (is_null($user)) {
            $response = [
                'message' => 'user not found',
            ];
            return  response($response, 404);
        }
        $response = [
            'user' => $user,
            'user_has_roles' => $user->roles->pluck("name"),
            'roles' => Role::all(),
            'teachers' => Teacher::all()

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
            'teacher_id' => $request->teacher_id ?? null,
            'file_upload_id' => $request->photo_id,
        ]);

        $teacher = Teacher::find($request->teacher_id);
        if (!empty($teacher)) {
            $teacher->update(['is_enable_account' => 1]);
        }
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
            }
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }

    public function restore($id)
    {
        $items = User::withTrashed()->find($id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }

    public function exportExcel(Request $request)
    {
        if (isset($request->is_show_trust)) {
            return $this->exporter->download(new UsersExport($request->is_show_trust), 'users.xlsx');
        }
        return $this->exporter->download(new UsersExport(), 'users.xlsx');
    }

    public function exportPDF(Request $request)
    {
        $users = User::query();

        if ($request->has('is_show_trust') && $request->is_show_trust) {
            $users = User::onlyTrashed();
        }

        $pdf = PDF::loadView('list.user', [
            'users' => $users->with(['roles'])->get()
        ]);

        return $pdf->stream('users.pdf');
    }

    public function updatePW(Request $request, $id)
    {
        $request->validate([
            'old_pw' => 'required',
            'new_pw' => 'required',
        ]);
        $field = filter_var($request->email, FILTER_VALIDATE_EMAIL) ? 'email' : 'name';
        $user = User::where('id', $id)->first();
        if (!$user || !Hash::check($request->old_pw, $user->password)) {
            return response([
                'message' => 'ពាក្យសម្ងាត់ចាស់មិនត្រឹមត្រូវ'
            ], 403);
        }
        $user->password = bcrypt($request->new_pw);
        $user->save();
        $response = [
            'data' => 'ពាក្យសម្ងាត់បានផ្លាស់ប្ដូរ',
        ];
        return  response($response, 200);
    }
}
