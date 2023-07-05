<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;

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
}
