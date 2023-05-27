<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\NoteController;
use App\Http\Controllers\TermContoller;
use App\Http\Controllers\TypeController;
use App\Http\Controllers\ActivationController;
use App\Http\Controllers\ActivationLineController;
use App\Http\Controllers\PreferanceController;
use App\Http\Controllers\UploadFileController;
use App\Http\Controllers\Admin\UserController;

//Version 1 API
Route::prefix('v1')->group(function(){
  // User 
  Route::post('/register' , [AuthController::class, 'register']);
  Route::post('/login' , [AuthController::class, 'login']);
  // Protection Auth
  Route::group(['middleware' => ['auth:sanctum']] , function(){
    Route::get('/user/get', [AuthController::class, 'get']);
    Route::post('/logout' , [AuthController::class, 'logout']);

    // Users  
    Route::prefix('user')->group(function () {
      Route::get('/get' , [UserController::class, 'index']);
      Route::get('/create' , [UserController::class, 'create']);
      Route::post('/store' , [UserController::class, 'store']);
      Route::get('/{id}/get' , [UserController::class, 'show']);
      Route::get('/{id}/edit' , [UserController::class, 'edit']);
      Route::post('/{id}/update' , [UserController::class, 'update']);
      Route::delete('/{id}/destroy' , [UserController::class, 'destroy']);
    });
        // Files  
    Route::prefix('files')->group(function () {
      Route::get('/get' , [UploadFileController::class, 'index']);
      Route::post('/create/upload' , [UploadFileController::class, 'store']);
      // Route::post('/create' , [UploadFileController::class, 'store']);
      Route::get('/get/upload/{id}' ,[UploadFileController::class, 'getUploadFileByActivation']);
      // Preview File
      Route::get('storage/{filename}', function ($filename)
      {
        $name = "app\public\images\ $filename";
        $string = preg_replace('/\s+/', '',$name);
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
  });
});