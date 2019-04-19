<?php

Route::prefix('account')->group(function() {

    $controller='ConnectAccountController@';

    Route::post('get-connected-account',$controller.'getConnectedAccount');
});

Route::prefix('facebook')->group(function() {

    $controller='FBController@';

    Route::get('generateURL',$controller.'dogenerateURL');
});