<?php

namespace App\Http\Controllers;

use App\Models\Classes;
use Illuminate\Http\Request;
use App\Models\Student;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;


class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $student =  Student::with('current_class.class', 'profile_img')->get();
        $class =   Classes::all()->map(function ($item, $index) {
            return [
                "text" => $item["class_name"],
                "value" => $item["class_id"]
            ];
        });
        $response = [
            'data' => $student,
            'class' => $class
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
            'gender_id' => 'required',
            'date_of_birth' => 'required',
            'place_of_birth' => 'required',
            'status_id' => 'required'
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request) {
            $items = new Student();
            $items->fill($validator->validated());
            $items->sid       = $request->sid;
            $items->address   = $request->address;
            $items->file_upload_id    = $request->file_upload_id;
            $items->phone     = $request->phone;
            $items->email     = $request->email;
            $items->from_secondary_high_school     = $request->from_secondary_high_school;
            $items->secondary_exam_date     = $request->secondary_exam_date;
            $items->secondary_exam_place     = $request->secondary_exam_place;
            $items->secondary_exam_room     = $request->secondary_exam_room;
            $items->secondary_exam_desk     = $request->secondary_exam_desk;
            $items->other     = $request->other;
            $items->save();
        });

        $response = [
            'data' => ' Create successfull',
        ];
        return  response($response, 200);
    }

    public function edit($id)
    {
        $teacher = Student::find($id);
        $response = [
            'data' => $teacher,
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
            'gender_id' => 'required',
            'date_of_birth' => 'required',
            'place_of_birth' => 'required',
            'status_id' => 'required'
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 400);
        }
        DB::transaction(function () use ($validator, $request, $id) {
            $items = Student::find($id);
            $items->sid       = $request->sid;
            $items->address   = $request->address;
            $items->file_upload_id    = $request->file_upload_id;
            $items->phone     = $request->phone;
            $items->email     = $request->email;
            $items->from_secondary_high_school     = $request->from_secondary_high_school;
            $items->secondary_exam_date     = $request->secondary_exam_date;
            $items->secondary_exam_place     = $request->secondary_exam_place;
            $items->secondary_exam_room     = $request->secondary_exam_room;
            $items->secondary_exam_desk     = $request->secondary_exam_desk;
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
            $items = Student::find($id)->delete();
        });

        $response = [
            'data' => 'Delete successfull',
        ];
        return  response($response, 200);
    }
}
