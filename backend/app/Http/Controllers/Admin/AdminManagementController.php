<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth;
use Illuminate\Http\Request;
use App\Http\Requests;
use Exception;
use Validator;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use File;
use App\User;

// Repository
use App\Repository\UserRepository;

class AdminManagementController extends Controller {

    /*
    |--------------------------------------------------------------------------
    |  User Management Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the user management from admin.
    | 
    */

    private $request;

    private $userRepository;


    public function __construct(Request $Request, UserRepository $UserRepository) {

        $this->request = $Request;

        $this->userRepository = $UserRepository;

        $this->profile_picture_upload_path = public_path().config('app.img_path.profile_picture');
        $this->profile_picture_display_path = url('/public').config('app.img_path.profile_picture');
    }

    /**
     *  Function to get front-end user info.
     *
     *  @param Request data and user repository instance.
     *
     *  @return json response.
     *
     *  Created By : Shagun | Created On : 1st March 2019
    **/
    public function getAdminData($role_id) {
        try {

            $resultSet = $this->userRepository->getData(['role_id' => $role_id], 'get', ['mobileCode']);

            return response()->json([
                'status'=>'success',
                'data'=>$resultSet
            ],200);

        } catch(\Exception $ex) {
            return response()->json([
                'status'=>'error',
                'message'=>'Error: '.$ex->getMessage(),
                'error_details'=> 'on line: '.$ex->getLine().'on file: '.$ex->getFile()
            ],200);
        }
    }

    /**
     *  Function to get front-end user info.
     *
     *  @param @var id as integer.
     *
     *  @return json response.
     *
     *  Created By : Shagun | Created On : 1st March 2019
    **/
    public function getAdminDetails($id) {
        try {
            $resultSet = $this->userRepository->getData(['id' => $id], 'first', ['mobileCode']);
            return response()->json([
                'status'=>'success',
                'data'=>$resultSet,
                'image_path' => $this->profile_picture_display_path
            ],200);

        } catch(\Exception $ex) {
            return response()->json([
                'status'=>'error',
                'message'=>'Error: '.$ex->getMessage(),
                'error_details'=> 'on line: '.$ex->getLine().'on file: '.$ex->getFile()
            ],200);
        }
    }

    public function addAdmin() {
        try {
            $validator = Validator::make($this->request->all(), [
                'first_name' => 'required | alpha',
                'last_name' =>'required | alpha',
                'email' =>'required | email',
                'mobile_code' => 'required',
                'mobile' => 'required',
                'password' => 'required | confirmed',
                'password_confirmation' => 'required',
            ]);

            if ($validator->fails()) {
                foreach ($validator->messages()->getMessages() as $field_name => $messages){
                    throw new Exception($messages[0], 1);
                }
            }

            $data=$this->request;

            $resultSet = $this->userRepository->getData(['email' => $this->request->email], 'first');

            if (!empty($resultSet)) {
                throw new Exception('User already registered with same Email ID.', 1);
            }

            $addAdmin=$this->userRepository->createUpdateData([
                    'id'=>$data->id
                ],[
                    'role_id' => 1,
                    'first_name' => ucwords($data->first_name),
                    'last_name' => ucwords($data->last_name),
                    'email' => $data->email,
                    'mobile_code' => $data->mobile_code,
                    'mobile' => $data->mobile,
                    'email_verified_at' => Carbon::now(),
                    'password' => Hash::make($this->request->password),
                ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Admin Created Successfully.'
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }
}