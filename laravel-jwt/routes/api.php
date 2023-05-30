<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TodoController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

//Route::controller(AuthController::class)->group(function () {
//    Route::post('login', 'login');
//    Route::post('register', 'register');
//    Route::post('logout', 'logout');
//    Route::post('profile', 'profile');
//    Route::post('refresh', 'refresh');
//});

Route::post('/login', [AuthController::class,'login']);
Route::post('/register', [AuthController::class,'register']);
Route::post('/logout', [AuthController::class,'logout']);
Route::post('/profile', [AuthController::class,'profile']);
Route::post('/refresh', [AuthController::class,'refresh']);


Route::post('/getTodoAll', [TodoController::class,'getTodoAll']);
Route::post('/TodoDelete/{id}', [TodoController::class,'TodoDelete']);
Route::post('/TodoDetails/{id}', [TodoController::class,'TodoDetails']);
Route::post('/TodoUpdate', [TodoController::class,'TodoUpdate']);
Route::post('/TodoAdd', [TodoController::class,'TodoAdd']);
