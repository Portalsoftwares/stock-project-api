<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teacher =  Teacher::with('profile_img')->get();
        $response = [
            'data' => $teacher,
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
            'teacher_level' => 'required|integer',
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
            $teacher = new Teacher();
            $teacher->fill($validator->validated());
            $teacher->tid       = $request->tid;
            $teacher->join_date = $request->join_date;
            $teacher->address   = $request->address;
            $teacher->file_upload_id    = $request->file_upload_id;
            $teacher->phone     = $request->phone;
            $teacher->email     = $request->email;
            $teacher->is_enable_account = $request->is_enable_account;
            $teacher->other     = $request->other;
            $teacher->save();
        });

        $response = [
            'data' => 'successfull',
        ];
        return  response($response, 200);
    }
}
