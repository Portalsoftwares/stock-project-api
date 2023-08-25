<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;
use Exception;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Teacher::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'tid';
        if ($per_page == -1) {
            $per_page = DB::table('teachers')->count() > 0 ? DB::table('teachers')->count() : $per_page;
        }


        if (!empty($request->filter_profession)) {
            $items->whereIn('profession', 'like', $request->filter_profession);
        }
        if (!empty($request->filter_teacher_level)) {
            $items->whereIn('teacher_level', $request->filter_teacher_level);
        }
        if (!empty($request->search)) {
            $items->where('tid', 'like', "%" . $request->search . "%");
            $items->orWhere('full_name_kh', 'like', "%" . $request->search . "%");
            $items->orWhere('full_name_en', 'like', "%" . $request->search . "%");
            $items->orWhere('email', 'like', "%" . $request->search . "%");
            $items->orWhere('phone', 'like', "%" . $request->search . "%");
        }
        if (!empty($request->is_show_trust)) {
            $items->onlyTrashed();
        }
        $data = $items->with('profile_img')
            ->orderBy($sort_by, $order_by)
            ->orderBy('tid', $order_by)
            ->paginate(5);

        $response = [
            'data' => $data,
        ];
        return  response($response, 200);
    }

    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'full_name_kh' => 'required|string',
            'first_name_kh' => 'required|string',
            'last_name_kh' => 'required|string',
            'full_name_en' => 'required|string',
            'first_name_en' => 'required|string',
            'last_name_en' => 'required|string',
            'teacher_level' => 'required|string',
            'profession' => 'required|string',
            'gender_id' => 'required',
            'date_of_birth' => 'required',
            'place_of_birth' => 'required',
            'role' => 'required',
            'status_id' => 'required'
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new Teacher();
            $items->fill($validator->validated());
            $items->tid       = $request->tid??"BBB";
            $items->join_date = $request->join_date??"798989";
            $items->address   = $request->address;
            $items->file_upload_id    = $request->file_upload_id;
            $items->phone     = $request->phone;
            $items->email     = $request->email;
            $items->is_enable_account = $request->is_enable_account??0;
            $items->other     = $request->other??"test";
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function restore($id)
    {
        $items = Teacher::withTrashed()->where('teacher_id', $id)->restore();
        $response = [
            'data' => 'Restore successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $items = Teacher::with('profile_img')->find($id);
        $response = [
            'data' => $items,
        ];
        return  response($response, 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'full_name_kh' => 'required|string',
            'first_name_kh' => 'required|string',
            'last_name_kh' => 'required|string',
            'full_name_en' => 'required|string',
            'first_name_en' => 'required|string',
            'last_name_en' => 'required|string',
            'teacher_level' => 'required|string',
            'profession' => 'required|string',
            'gender_id' => 'required',
            'date_of_birth' => 'required',
            'place_of_birth' => 'required',
            'role' => 'required',
            'status_id' => 'required'
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = Teacher::find($id);
            $items->fill($validator->validated());
            $items->tid       = $request->tid;
            $items->join_date = $request->join_date;
            $items->address   = $request->address;
            $items->file_upload_id    = $request->file_upload_id;
            $items->phone     = $request->phone;
            $items->email     = $request->email;
            $items->is_enable_account = $request->is_enable_account;
            $items->other     = $request->other;
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
            $items = Teacher::find($id)->delete();
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }
}
