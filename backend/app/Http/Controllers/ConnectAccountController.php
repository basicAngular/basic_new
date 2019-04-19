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

class ConnectAccountController extends Controller
{
    /*
    |-------------------------------------------------------------------------
    | Connect Account Controller
    |-------------------------------------------------------------------------
    |
    | This controller handles the connect account.
    | 
    */

    private $request;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $Request)
    {
        $this->request = $Request;
    }

    /**
     *  Function to get the connected pages to FB account.
     *
     *  @param : Facebook SDK class instance.
     *
     *  @return : JSON response.
     *
     *  Createted By : RaHHuL | Created On : 21 sept 2018
    **/
    public function getConnectedAccount(FacebookSDK $fb)
    {
    	try{
            $validator = Validator::make($this->request->all(), [
                'token' => 'required',
                'user_id' =>'required'
            ]);

            if ($validator->fails())
            {
                throw new Exception("Required parameter missing", 1);
            }

            $data = $fb->get('/me/accounts?fields=connected_instagram_account,name,id', $this->request->token);

        	$decoded_response = json_decode($data->getBody());

            $responseArr = [];

            foreach ($decoded_response as $key => $value)
            {
                if (!empty($value->connected_instagram_account))
                {
                    array_push($responseArr, $value);
                }
            }

            return response()->json([
                'status' => 'success',
                'data' => $responseArr,
            ], 200);
        }catch (\Exception $ex){
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }
}