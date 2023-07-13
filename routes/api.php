<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UploadFileController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\ClassController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\ScheduleController;
use App\Http\Controllers\AttendanceController;

//Version 1 API
Route::prefix('v1')->group(function () {
  // User 
  Route::post('/register', [AuthController::class, 'register']);
  Route::post('/login', [AuthController::class, 'login']);
  // Protection Auth
  Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/user/get', [AuthController::class, 'get']);
    Route::post('/logout', [AuthController::class, 'logout']);

    // Users  
    Route::prefix('user')->group(function () {
      Route::get('/get', [UserController::class, 'index']);
      Route::get('/create', [UserController::class, 'create']);
      Route::post('/store', [UserController::class, 'store']);
      Route::get('/{id}/get', [UserController::class, 'show']);
      Route::get('/{id}/edit', [UserController::class, 'edit']);
      Route::post('/{id}/update', [UserController::class, 'update']);
      Route::delete('/{id}/destroy', [UserController::class, 'destroy']);
    });
    // Files  
    Route::prefix('files')->group(function () {
      Route::get('/get', [UploadFileController::class, 'index']);
      Route::post('/create/upload', [UploadFileController::class, 'store']);
      // Route::post('/create' , [UploadFileController::class, 'store']);
      Route::get('/get/upload/{id}', [UploadFileController::class, 'getUploadFileByActivation']);
      // Preview File
      Route::get('storage/{filename}', function ($filename) {
        $name = "app\public\images\ $filename";
        $string = preg_replace('/\s+/', '', $name);
        $path = storage_path($string);
        if (!File::exists($path)) {
          abort(404);
        }
        $file = File::get($path);
        $type = File::mimeType($path);
        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);
        return  $response;
      });
    });
    //Student
    Route::prefix('student')->group(function () {
      Route::get('/get', [StudentController::class, 'index']);
    });
    //Teacher
    Route::prefix('teacher')->group(function () {
      Route::get('/get', [TeacherController::class, 'index']);
    });
    //Subject
    Route::prefix('subject')->group(function () {
      Route::get('/get', [SubjectController::class, 'index']);
      // Level
      Route::get('/get_subject_level', [SubjectController::class, 'getSubjectLevel']);
    });
    //Subject
    Route::prefix('subject')->group(function () {
      Route::get('/get', [SubjectController::class, 'index']);
    });
    //Grade Level
    Route::prefix('grade_level')->group(function () {
      Route::get('/get', [ClassController::class, 'index']);
      Route::get('/teacher/{id}/get', [ClassController::class, 'getTeacher']);
    });
    //Schedule class
    Route::prefix('schedule_class')->group(function () {
      Route::get('/{id}/get', [ScheduleController::class, 'index']);
      Route::get('/{id}/schedule', [ScheduleController::class, 'getScheduleDayTime']);
      Route::post('/create', [ScheduleController::class, 'create']);
    });
    //Teacher class
    Route::prefix('teacher_class')->group(function () {
      Route::post('/create', [ScheduleController::class, 'createTeacher']);
    });
    //Attendance 
    Route::prefix('attendance')->group(function () {
      Route::post('/call/{id}', [AttendanceController::class, 'callStudentAttendance']);
      Route::post('/create', [AttendanceController::class, 'create']);
      Route::post('/report/{id}', [AttendanceController::class, 'reportInclass']);
    });
  });
});
