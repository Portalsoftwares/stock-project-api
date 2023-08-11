<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Academic;

class AcademicController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teacher =  Academic::all();
        $response = [
            'data' => $teacher,
        ];
        return  response($response, 200);
    }
}
