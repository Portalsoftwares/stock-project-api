<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\GradeLevel;


class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $student =  Student::with('current_class.class')->get();
        $class =  GradeLevel::all()->map(function ($item, $index) {
            return [
                "text" => $item["grade_name"],
                "value" => $item["grade_level_id"]
            ];
        });
        $response = [
            'data' => $student,
            'class' => $class
        ];
        return  response($response, 200);
    }
}
