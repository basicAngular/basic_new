<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Requests;
use Exception;
use Validator;
use DB;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\MailController;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
use SammyK\LaravelFacebookSdk\LaravelFacebookSdk as FacebookSDK;
// Repository
use App\Repository\UserRepository;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Auth Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the Authentication of users.
    | 
    */

    private $request;

    private $client;

    private $secret;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $Request, Client $Client)
    {
        $this->request = $Request;

        $this->client = $Client;

        // $this->secret = env('OAUTH_SECRET');
        $this->secret = "A44tDDu5QyaEtOGi1qWY564MsAxz6PrRLAcragZQ";
    }

    /**
     *  Function to authenticate user.
     *
     *  @return : authenticate token and authenticated user data.
     *
     *  Createted By : RaHHuL | Created On : 21 sept 2018
    **/
    
    public function doAuthenticateUser(UserRepository $UserRepository)
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'email' => 'required | email',
                'password' =>'required'
            ]);

            if ($validator->fails())
            {
                throw new Exception("Required parameter missing", 1);
            }

            $response = $this->client->post(url('/').'/oauth/token', [
                'form_params' => [
                    'client_id' => 2,
                    'client_secret' => $this->secret,
                    'grant_type' => 'password',
                    'username' => $this->request->email,
                    'password' => $this->request->password,
                    'scope' => '*',
                ]
            ]);

            //$auth = json_decode((string) $response->getBody());
            $auth = $response->getBody();

            if (empty($auth))
            {
                throw new Exception('Authentication Failed.', 1);
            }

            $UserData = $UserRepository->getData(['email' => $this->request->email], 'first');

            if (empty($UserData))
            {
                throw new Exception('User Details not found.', 1);
            }

            if (empty($UserData['email_verified_at']))
            {
                throw new Exception("Email not verified, please verify email !!!", 1);
            }

            if ($UserData['is_active'] == 0)
            {
                throw new Exception("User is not activated. please contact admin.", 1);
            }

            $UserData['picture_path'] = url('/public').config('app.img_path.profile_picture');

            return response()->json([
                'status' => 'success',
                'auth_data' => $UserData,
                //'authorization_token' => $auth->token_type.' '.$auth->access_token,
                'authorization_token' => $auth,

            ], 200);
        }catch(RequestException $gex){
            return $gex;
            if($gex->getCode() == 401){
                return response()->json([
                    'status' => 'error',
                    'message' => 'Error : Invalid Username or Password.',
                ], 200);
            }else{
                return response()->json([
                    'status' => 'error',
                    'message' => 'Error : '.$gex->getMessage(),
                ], 200);
            }
        }catch (\Exception $ex){
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }

    /**
     *  Function to Register user.
     *
     *  @param : user repository instance and mail controller instance
     *
     *  @return : JSON response.
     *
     *  Created By : RaHHuL | Created On : 27 Sept 2018
    **/
    public function doRegisterUser(UserRepository $UserRepository, MailController $MailController)
    {
        
        try{
            $validator = Validator::make($this->request->all(), [
                'first_name' => 'required',
                'last_name' =>'required',
                'mobile_code' =>'required | integer',
                'mobile' =>'required | min:7',
                'email' =>'required | email',
                'password' => 'required | confirmed',
                'password_confirmation' => 'required',
            ]);

            if ($validator->fails()) 
            {
                foreach ($validator->messages()->getMessages() as $field_name => $messages){
                    throw new Exception($messages[0], 1);
                }
            }

            $userCount = $UserRepository->getCount(['email' => $this->request->email]);

            if ($userCount > 0)
            {
                throw new Exception("User already registered with same Email Id.", 1);
            }

            DB::beginTransaction();

            $userResponseData = $UserRepository->createUpdateData(['id' => $this->request->id], [
                'first_name' => ucwords($this->request->first_name),
                'last_name' => ucwords($this->request->last_name),
                'email' => $this->request->email,
                'mobile_code' => $this->request->mobile_code,
                'mobile' => $this->request->mobile,
                'password' => Hash::make($this->request->password),
                'role_id' => 2,
                'is_active' => '0',
                'ip_address' => $this->request->ip(),
            ]);

            /*$response = $this->client->post(url('/').'/oauth/token', [
                'form_params' => [
                    'client_id' => 2,
                    'client_secret' => $this->secret,
                    'grant_type' => 'password',
                    'username' => $this->request->email,
                    'password' => $this->request->password,
                    'scope' => '*',
                ]
            ]);

            $auth = json_decode((string) $response->getBody());

            if (empty($auth)) 
            {
                throw new Exception('Authentication Failed.', 1);
            }*/
/*
            $MailController->userRegistrationMail([
                'email' => $userResponseData->email,
                'name' => $userResponseData->first_name.' '.$userResponseData->last_name,
            ]);*/

            DB::commit();

            return response()->json([
                'status' => 'success',
                'message' => 'Registered Successfully : Thankyou for showing your interest !!!',
                /*'auth_data' => $userResponseData,
                'authorization_token' => $auth->token_type.' '.$auth->access_token,*/
            ], 200);
        }catch (\Exception $ex){

            DB::rollback();
            
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }

    /**
     *  Function to Verify user email.
     *
     *  @param : user repository instance.
     *
     *  @param : @var token as string.
     *
     *  @return : JSON response.
     *
     *  Created By : RaHHuL | Created On : 21 Jan 2019
    **/
    public function verifyEmail($token, UserRepository $UserRepository)
    {
        try {
            $email = Crypt::decryptString($token);

            $userData = $UserRepository->getData(['email' => $email], 'first');

            if (empty($userData))
            {
                throw new Exception("Invalid Link !!!", 1);
            }

            if (!empty($userData['email_verified_at']))
            {
                throw new Exception("User is already verified !!!", 1);
            }

            $userResponseData = $UserRepository->createUpdateData(['email' => $email], [
                'is_active' => '1',
                'email_verified_at' => Carbon::now(),
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Email Verified Successfully !!!',
                /*'auth_data' => $userResponseData,
                'authorization_token' => $auth->token_type.' '.$auth->access_token,*/
            ], 200);
        } catch (\Exception $ex) {

            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }


    public function test(FacebookSDK $fb)
    {
        $data = $fb->get('/me',"EAAhoBVf27sgBAJZCVHN585hp638fg1LjN7wK4DhHxAWvxONK2DEve9KLfIN2kOyk017lo9pBIOVifyu82hkzZBvwaqp3KreDGXMxX2XdvTietZBNCCKAyLLU5fXVSURugXzRiYLMRZCwbhmkaK3ec5Rn0v7aX4ygttRmZCzSmzLZBFFMMl5IRy2pZBfZAAGciisWMIzyxNTf8AZDZD");

        dd($data->getGraphUser());
        // dd($data->getGraphUser());
    }
}