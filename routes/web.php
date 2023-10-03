<?php

use Illuminate\Support\Facades\Route;
use \Mpdf\Mpdf as PDF;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get("/preivew", function () {
    $mpdf = new PDF();
    $mpdf->WriteHTML("<h1>Hello</h1>");
    $mpdf->Output('MyPDF.pdf', 'I');
});

// route main point to vue index
Route::get('/{any?}', function () {
    return view('app');
})->where('any', '^(?!api\/)[\/\w\.-]*');
