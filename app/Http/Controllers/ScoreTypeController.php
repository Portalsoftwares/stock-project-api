<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScoreType;

class ScoreTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teacher =  ScoreType::all();
        $response = [
            'data' => $teacher,
        ];
        return  response($response, 200);
    }
}
