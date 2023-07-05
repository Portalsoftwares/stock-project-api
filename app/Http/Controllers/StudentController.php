<?php

namespace App\Http\Controllers;

use App\Models\Classes;
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
}
