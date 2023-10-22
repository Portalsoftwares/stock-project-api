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
use App\Http\Controllers\ScoreController;
use App\Http\Controllers\TimeController;
use App\Http\Controllers\AcademicController;
use App\Http\Controllers\BackUpController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ScoreTypeController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\PreferanceController;
use App\Http\Controllers\RoleController;

//Version 1 API
Route::prefix('v1')->group(function () {
  // User 
  Route::post('/register', [AuthController::class, 'register']);
  Route::post('/login', [AuthController::class, 'login']);
  // Protection Auth
  Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/user/get', [AuthController::class, 'get']);
    Route::post('/logout', [AuthController::class, 'logout']);
    //Dashboard Data
    Route::get('/dashboard', [DashboardController::class, 'index']);
    // Users  
    Route::prefix('user')->group(function () {
      Route::get('/get', [UserController::class, 'index']);
      Route::get('/create', [UserController::class, 'create']);
      Route::post('/store', [UserController::class, 'store']);
      Route::get('get/{id}', [UserController::class, 'show']);
      Route::get('edit/{id}', [UserController::class, 'edit']);
      Route::post('update/{id}', [UserController::class, 'update']);
      Route::post('update/{id}/pw', [UserController::class, 'updatePW']);
      Route::delete('delete/{id}', [UserController::class, 'delete']);
      Route::post('/restore/{id}', [UserController::class, 'restore']);

      Route::post('/exportExcel', [UserController::class, 'exportExcel']);
      Route::post('/exportPDF', [UserController::class, 'exportPDF']);
    });
    // Files  
    Route::prefix('files')->group(function () {
      Route::get('/get', [UploadFileController::class, 'index']);
      Route::post('/create/upload', [UploadFileController::class, 'store']);
      // Route::post('/create' , [UploadFileController::class, 'store']);
      Route::get('/get/upload/{id}', [UploadFileController::class, 'getUploadFileByActivation']);
    });
    //Student
    Route::prefix('student')->group(function () {
      Route::get('/get', [StudentController::class, 'index']);
      Route::post('/create', [StudentController::class, 'create']);
      Route::get('/edit/{id}', [StudentController::class, 'edit']);
      Route::post('/update/{id}', [StudentController::class, 'update']);
      Route::delete('/delete/{id}', [StudentController::class, 'delete']);
      Route::post('/restore/{id}', [StudentController::class, 'restore']);
      Route::post('/exportExcel', [StudentController::class, 'exportExcel']);
      Route::post('/exportPDF', [StudentController::class, 'exportPDF']);
    });
    //Teacher
    Route::prefix('teacher')->group(function () {
      Route::get('/get', [TeacherController::class, 'index']);
      Route::post('/create', [TeacherController::class, 'create']);
      Route::get('/edit/{id}', [TeacherController::class, 'edit']);
      Route::post('/update/{id}', [TeacherController::class, 'update']);
      Route::delete('/delete/{id}', [TeacherController::class, 'delete']);
      Route::post('/restore/{id}', [TeacherController::class, 'restore']);
      Route::post('/exportExcel', [TeacherController::class, 'exportExcel']);
      Route::post('/exportPDF', [TeacherController::class, 'exportPDF']);
    });
    //Subject
    Route::prefix('subject')->group(function () {
      Route::get('/get', [SubjectController::class, 'index']);
      Route::post('/create', [SubjectController::class, 'create']);
      Route::get('/edit/{id}', [SubjectController::class, 'edit']);
      Route::post('/update/{id}', [SubjectController::class, 'update']);
      Route::delete('/delete/{id}', [SubjectController::class, 'delete']);
      Route::post('/restore/{id}', [SubjectController::class, 'restore']);

      Route::post('/exportExcel', [SubjectController::class, 'exportExcel']);
      Route::post('/exportPDF', [SubjectController::class, 'exportPDF']);
    });
    //Subject Grade Level 
    Route::prefix('subject-level')->group(function () {
      Route::get('/get', [SubjectController::class, 'getSubjectLevel']);
      Route::post('/create', [SubjectController::class, 'createSubjectLevel']);
      Route::get('/edit/{id}', [SubjectController::class, 'editSubjectLevel']);
      Route::post('/update/{id}', [SubjectController::class, 'updateSubjectLevel']);
      Route::delete('/delete/{id}', [SubjectController::class, 'deleteSubjectLevel']);
      Route::post('/restore/{id}', [SubjectController::class, 'restoreSubjectLevel']);
    });

    //Class
    Route::prefix('class')->group(function () {
      Route::get('/get', [ClassController::class, 'index']);
      Route::get('/teacher/{id}/get', [ClassController::class, 'getTeacher']);
      Route::post('/create', [ClassController::class, 'create']);
      Route::get('/edit/{id}', [ClassController::class, 'edit']);
      Route::post('/update/{id}', [ClassController::class, 'update']);
      Route::delete('/delete/{id}', [ClassController::class, 'delete']);
      Route::post('/restore/{id}', [ClassController::class, 'restore']);
      //Add student in Class
      Route::post('/student/{id}/add', [ClassController::class, 'addStudentClass']);
      Route::get('/student/{id}/get', [ClassController::class, 'getStudentToClass']);
      Route::delete('/student/{id}/delete/{student_id}', [ClassController::class, 'deleteStudentToClass']);
      Route::post('/student/{id}/export-pdf', [ClassController::class, 'exportStudentListPDF']);
      Route::post('/student/{id}/export-excel', [ClassController::class, 'exportStudentListExcel']);
    });

    //Schedule class
    Route::prefix('schedule_class')->group(function () {
      Route::get('/{id}/get', [ScheduleController::class, 'index']);
      Route::get('/{id}/edit', [ScheduleController::class, 'edit']);
      Route::get('/{id}/schedule', [ScheduleController::class, 'getScheduleDayTime']);
      Route::post('/{id}/create', [ScheduleController::class, 'create']);

      Route::post('/{id}/schedule/export', [ScheduleController::class, 'exportExcel']);
    });
    //Teacher class
    Route::prefix('teacher_class')->group(function () {
      Route::post('/create', [ScheduleController::class, 'createTeacher']);
      Route::get('/edit/{id}', [ScheduleController::class, 'editTeacher']);
    });
    //Attendance 
    Route::prefix('attendance')->group(function () {
      Route::get('/call/{id}', [AttendanceController::class, 'getCallAttendance']);
      Route::post('/call/{id}', [AttendanceController::class, 'callStudentAttendance']);
      Route::post('/create', [AttendanceController::class, 'create']);
      Route::post('/report/{id}', [AttendanceController::class, 'reportInclass']);
      Route::post('/report/monthly/{id}', [AttendanceController::class, 'reportInclassMonthly']);
      Route::post('/report/monthly/get/{id}', [AttendanceController::class, 'reportInclassMonthlyGenerate']);

      //Report
      Route::post('/report/{id}/export', [AttendanceController::class, 'exportPDF']);
      Route::post('/report/{id}/export-excel', [AttendanceController::class, 'exportEXCEL']);

      Route::post('/report-subject/{id}/export', [AttendanceController::class, 'exportSubjectPDF']);
      Route::post('/report-subject/{id}/export-excel', [AttendanceController::class, 'exportSubjectEXCEL']);
    });
    //Score 
    Route::prefix('score')->group(function () {
      Route::post('/collect/{id}', [ScoreController::class, 'index']);
      Route::post('/collect/report/{id}', [ScoreController::class, 'reportSubject']);
      Route::post('/collect/all/{id}', [ScoreController::class, 'allsubeject']);
      Route::post('/collect/all/{id}/create', [ScoreController::class, 'createAllSubject']);
      Route::get('/collect/all/{id}/exam', [ScoreController::class, 'getExam']);
      Route::post('/collect/{id}/create', [ScoreController::class, 'create']);
      //Report
      Route::post('/report/{id}/export', [ScoreController::class, 'exportPDF']);
      Route::post('/report/{id}/export-excel', [ScoreController::class, 'exportEXCEL']);
    });
    //Time 
    Route::prefix('time')->group(function () {
      Route::get('/get', [TimeController::class, 'index']);
      Route::post('/create', [TimeController::class, 'create']);
      Route::get('/edit/{id}', [TimeController::class, 'edit']);
      Route::post('/update/{id}', [TimeController::class, 'update']);
      Route::post('/restore/{id}', [TimeController::class, 'restore']);
      Route::delete('/delete/{id}', [TimeController::class, 'delete']);
    });
    //Academic
    Route::prefix('academic')->group(function () {
      Route::get('/get', [AcademicController::class, 'index']);
      Route::post('/create', [AcademicController::class, 'create']);
      Route::get('/edit/{id}', [AcademicController::class, 'edit']);
      Route::post('/update/{id}', [AcademicController::class, 'update']);
      Route::post('/restore/{id}', [AcademicController::class, 'restore']);
      Route::delete('/delete/{id}', [AcademicController::class, 'delete']);
    });
    //Score Type
    Route::prefix('score-type')->group(function () {
      Route::get('/get', [ScoreTypeController::class, 'index']);
      Route::post('/create', [ScoreTypeController::class, 'create']);
      Route::get('/edit/{id}', [ScoreTypeController::class, 'edit']);
      Route::post('/update/{id}', [ScoreTypeController::class, 'update']);
      Route::post('/restore/{id}', [ScoreTypeController::class, 'restore']);
      Route::delete('/delete/{id}', [ScoreTypeController::class, 'delete']);
      //academic
      Route::get('/academic/get', [ScoreTypeController::class, 'indexAcademic']);
      Route::post('/academic/create', [ScoreTypeController::class, 'createAcademic']);
      Route::get('/academic/edit/{id}', [ScoreTypeController::class, 'editAcademic']);
      Route::post('/academic/update/{id}', [ScoreTypeController::class, 'updateAcademic']);
      Route::post('/academic/restore/{id}', [ScoreTypeController::class, 'restoreAcademic']);
      Route::delete('/academic/delete/{id}', [ScoreTypeController::class, 'deleteAcademic']);
    });

    //Backup Restore
    Route::prefix('backup')->group(function () {
      Route::get('/get', [BackUpController::class, 'index']);
      Route::post('/create', [BackUpController::class, 'create']);
    });
    //Setting
    Route::prefix('setting')->group(function () {
      Route::get('/get', [SettingController::class, 'index']);
      Route::post('/update', [SettingController::class, 'update']);
    });
    //Report
    Route::prefix('report')->group(function () {
      Route::get('/preference', [PreferanceController::class, 'index']);
    });

    //Role
    Route::prefix('role')->group(function () {
      Route::get('/get', [RoleController::class, 'index']);
      Route::get('/get-permission', [RoleController::class, 'getPermissions']);
    });
  });
});
