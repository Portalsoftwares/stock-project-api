<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;
use App\Models\SubjectGradeLevel;

class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subject =  Subject::all();
        $response = [
            'data' => $subject,
        ];
        return  response($response, 200);
    }
    // Subject Grade Level

    public function getSubjectLevel()
    {
        $subjectLevel =  SubjectGradeLevel::with(['subject', 'grade_level', 'class_type'])->get();
        $response = [
            'data' => $subjectLevel,
        ];
        return  response($response, 200);
    }
}
