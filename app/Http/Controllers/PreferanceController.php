<?php

namespace App\Http\Controllers;

use App\Models\Academic;
use App\Models\Classes;
use App\Models\scoreType;
use Illuminate\Http\Request;
use Exception;

class PreferanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $academic_id = $request->acc ?? 1;
        $academic =  Academic::all();
        $class =  Classes::where('academic_id', $academic_id)->get();
        $report_type = scoreType::all();
        $response = [
            'academic' => $academic,
            'class' => $class,
            'report_type' => $report_type,
        ];
        return  response($response, 200);
    }
}
