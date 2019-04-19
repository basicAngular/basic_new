<?php

use Illuminate\Http\Request;

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

Route::get('/user/facebook/callback', 'FBController@getToken');   

Route::prefix('auth')->group(function () {

    $controller = 'AuthController@';

    Route::post('/do-authenticate-user', $controller.'doAuthenticateUser');

    Route::post('/do-register-user', $controller.'doRegisterUser');

    Route::get('/verify-email/{token}', $controller.'verifyEmail');
});

Route::prefix('password')->group(function () {

    $controller = 'ForgotAndResetPasswordController@';

    Route::post('/forgot-password', $controller.'forgotPassword');

    Route::post('/reset-password', $controller.'resetPassword');

    Route::post('/change-password', $controller.'changePassword')->middleware(['auth:api']);

    Route::post('/change-password-by-admin', $controller.'changePasswordByAdmin');
});


Route::middleware(['auth:api'])->group(function () {
    /*
    *   For admin routes
    **/
    Route::prefix('admin')->group(function () {
        include_once(__DIR__.'/route/admin_routes.php');
    });

    /*
    *   For user routes
    **/
    Route::prefix('user')->group(function () {
        include_once(__DIR__.'/route/user_routes.php');
    });
});

Route::prefix('master')->group(function () {

    $controller = 'MasterController@';

    Route::get('/get-phone-codes', $controller.'getPhoneCodes');

    Route::get('/get-country-names',$controller.'getCountryNames');

});