<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Exception;
use Validator;
use DB;
use App\Http\Controllers\MailController;
use SammyK\LaravelFacebookSdk\LaravelFacebookSdk as FacebookSDK;

class FBController extends Controller
{
    /*
    |-------------------------------------------------------------------------
    | FB Controller
    |-------------------------------------------------------------------------
    |
    | This controller handles the connect account.
    | 
    */

    private $request;

    private $fb;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $Request, FacebookSDK $fb)
    {
        $this->request = $Request;

        $this->fb = $fb;
    }

    /**
     *  Function to authenticate user.
     *
     *  @return : authenticate token and authenticated user data.
     *
     *  Createted By : RaHHuL | Created On : 21 sept 2018
    **/
    public function dogenerateURL()
    {
    	try{
            /*$validator = Validator::make($this->request->all(), [
                'token' => 'required',
                'user_id' =>'required'
            ]);

            if ($validator->fails())
            {
                throw new Exception("Required parameter missing", 1);
            }*/

            $login_url = $this->fb->getLoginUrl([
                'email',
                // 'pages_show_list',
                'manage_pages',
                // 'business_management'
            ], url('/').'/api/user/facebook/callback');

            return response()->json([
                'status' => 'success',
                'url' => $login_url,
            ], 200);
        }catch (\Exception $ex){
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }

    /**
     *  Function to authenticate user.
     *
     *  @return : authenticate token and authenticated user data.
     *
     *  Createted By : RaHHuL | Created On : 21 sept 2018
    **/
    public function getToken()
    {
        try{
            $token = $this->fb->getRedirectLoginHelper()->getAccessToken();
            
            return redirect(env('APP_URL').'corporate/connect-account/'.$token);

            /*return response()->json([
                'status' => 'success',
                'data' => ['token' => $token],
            ], 200);*/
        }catch (\Exception $ex){
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }
}