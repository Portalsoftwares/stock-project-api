<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScheduleClass;
use App\Models\Day;
use App\Models\Time;

class ScheduleClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id)
    {
        $data =  ScheduleClass::where('grade_level_id', $id)->with(['time', 'subject_day1', 'subject_day2', 'subject_day3', 'subject_day4', 'subject_day5', 'subject_day6', 'subject_day7'])->get();
        $response = [
            'data' => $data,
        ];
        return  response($response, 200);
    }

    public function  getScheduleDayTime()
    {
        $day =  Day::all();
        $time = Time::all();
        $data =  [
            'day' => $day,
            'time' => $time
        ];
        $response = [
            'data' => $data
        ];
        return  response($response, 200);
    }
}
