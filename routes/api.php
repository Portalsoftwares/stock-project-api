<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UploadFileController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\BackUpController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ProductsController;

//Version 1 API
Route::prefix('v1')->group(function () {
  // User 
  Route::post('/register', [AuthController::class, 'register']);
  Route::post('/login', [AuthController::class, 'login']);
  // Protection Auth
  Route::get('/user/get', [AuthController::class, 'get']);
  Route::group(['middleware' => ['auth:sanctum']], function () {
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
    Route::prefix('product')->group(function (){
       Route::get('/get', [ProductsController::class, 'index']);
       Route::post('/create', [ProductsController::class, 'create']);
       Route::get('/edit/{id}', [ProductsController::class, 'edit']);
       Route::post('/update/{id}', [ProductsController::class, 'update']);
       Route::delete('/delete/{id}', [ProductsController::class, 'destroy']);

    });
    // Files  
    Route::prefix('files')->group(function () {
      Route::get('/get', [UploadFileController::class, 'index']);
      Route::post('/create/upload', [UploadFileController::class, 'store']);
      // Route::post('/create' , [UploadFileController::class, 'store']);
      Route::get('/get/upload/{id}', [UploadFileController::class, 'getUploadFileByActivation']);
    });

    //Backup Restore
    Route::prefix('backup')->group(function () {
      Route::get('/get', [BackUpController::class, 'index']);
      Route::post('/create', [BackUpController::class, 'create']);
      Route::post('/restore/{id}', [BackUpController::class, 'restore']);
      Route::delete('/delete/{id}', [BackUpController::class, 'delete']);
    });
    //Setting
    Route::prefix('setting')->group(function () {
      Route::get('/get', [SettingController::class, 'index']);
      Route::post('/update', [SettingController::class, 'update']);
    });
    //Role
    Route::prefix('role')->group(function () {
      Route::get('/get', [RoleController::class, 'index']);
      Route::get('/get-permission', [RoleController::class, 'getPermissions']);
      Route::post('/store', [RoleController::class, 'create']);
      Route::get('/edit/{id}', [RoleController::class, 'edit']);
      Route::post('/update/{id}', [RoleController::class, 'update']);
      Route::delete('/delete/{id}', [RoleController::class, 'delete']);
    });
  });
});
