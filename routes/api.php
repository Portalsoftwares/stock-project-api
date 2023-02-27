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

    // Product
    Route::prefix('product')->group(function () {
      Route::get('/get' , [ProductController::class, 'index']);
      
      Route::post('/create' , [ProductController::class, 'store']);
      Route::get('/{id}/get' , [ProductController::class, 'show']);
      Route::put('/{id}/update' , [ProductController::class, 'update']);
      Route::delete('/{id}/destroy' , [ProductController::class, 'destroy']);
    });
      // Customer
    Route::prefix('customer')->group(function () {
      Route::get('/get' , [CustomerController::class, 'index']);
      Route::post('/create' , [CustomerController::class, 'store']);
      Route::get('/{id}/get' , [CustomerController::class, 'show']);
      Route::put('/{id}/update' , [CustomerController::class, 'update']);
      Route::delete('/{id}/destroy' , [CustomerController::class, 'destroy']);
    });
   // Contact
    Route::prefix('contact')->group(function () {
      Route::get('/get' , [ContactController::class, 'index']);
      Route::post('/create' , [ContactController::class, 'store']);
      Route::get('/{id}/get' , [ContactController::class, 'show']);
      Route::put('/{id}/update' , [ContactController::class, 'update']);
      Route::delete('/{id}/destroy' , [ContactController::class, 'destroy']);
      Route::get('/get-all' , [ContactController::class, 'getContact']);
    });
     // Note
    Route::prefix('note')->group(function () {
      Route::get('/get' , [NoteController::class, 'index']);
      Route::post('/create' , [NoteController::class, 'store']);
      Route::get('/{id}/get' , [NoteController::class, 'show']);
      Route::put('/{id}/update' , [NoteController::class, 'update']);
      Route::delete('/{id}/destroy' , [NoteController::class, 'destroy']);
  // Related Note activation
      Route::get('/get/activation/all' , [NoteController::class, 'getVNote']);
      Route::get('/get/activation/{id}' , [NoteController::class, 'getVNoteByActivation']);
      Route::get('/get/activation/{id}/activation-line/{lineId}' , [NoteController::class, 'getNotebyActivationLine']);
    });
     // Term
    Route::prefix('term')->group(function () {
      Route::get('/get' , [TermContoller::class, 'index']);
      Route::post('/create' , [TermContoller::class, 'store']);
      Route::get('/{id}/get' , [TermContoller::class, 'show']);
      Route::put('/{id}/update' , [TermContoller::class, 'update']);
      Route::delete('/{id}/destroy' , [TermContoller::class, 'destroy']);
    });
         // Type
    Route::prefix('type')->group(function () {
      Route::get('/get' , [TypeController::class, 'index']);
    });
     // Activation
    Route::prefix('activation')->group(function () {
      Route::get('/get' , [ActivationController::class, 'index']);
      Route::post('/create' , [ActivationController::class, 'store']);
      Route::get('/{id}/get' , [ActivationController::class, 'show']);
      Route::put('/{id}/update' , [ActivationController::class, 'update']);
      Route::delete('/{id}/destroy' , [ActivationController::class, 'destroy']);
      Route::get('/get-all' , [ActivationController::class, 'getActivationLine']);
    });
         // Activation Line
    Route::prefix('activation-line')->group(function () {
      Route::get('/get' , [ActivationLineController::class, 'index']);
      Route::post('/create' , [ActivationLineController::class, 'store']);
      Route::get('/{id}/get' , [ActivationLineController::class, 'show']);
      Route::put('/{id}/update' , [ActivationLineController::class, 'update']);
      Route::delete('/{id}/destroy' , [ActivationLineController::class, 'destroy']);
    });
    // Users  
    Route::prefix('user')->group(function () {
      Route::get('/get' , [UserController::class, 'index']);
      Route::get('/create' , [UserController::class, 'create']);
      Route::post('/store' , [UserController::class, 'store']);
      Route::get('/{id}/get' , [UserController::class, 'show']);
      Route::get('/{id}/edit' , [UserController::class, 'edit']);
      Route::put('/{id}/update' , [UserController::class, 'update']);
      Route::delete('/{id}/destroy' , [UserController::class, 'destroy']);
    });
        // Files  
    Route::prefix('files')->group(function () {
      Route::get('/get' , [UploadFileController::class, 'index']);
      Route::post('/create/upload/{id}' , [UploadFileController::class, 'store']);
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