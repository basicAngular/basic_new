<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Exception;
use Validator;
use App\PaymentGateway;
use App\Api_keys;
use App\Key_meta;
use DB;

class SettingController extends Controller
{

    public function addPaymentGateway(Request $request)
    {
    	try {
            $validator = Validator::make($request->all(), [
                'name' 			=> 'required | alpha',
                'publishable_key' =>'required',
                'secret_key' 	=> 'required'
            ]);

            if ($validator->fails()) {
                foreach ($validator->messages()->getMessages() as $field_name => $messages){
                    throw new Exception($messages[0], 1);
                }
            }
            $addAdmin=PaymentGateway::firstOrCreate([
            		'name' => $request->name,
                    'merchant_id' => $request->merchant_id,
                    'publishable_key' => $request->publishable_key,
                    'secret_key' => $request->secret_key,
                    'live_api_key'	=> $request->live_api_key,
            	]);

            return response()->json([
                'status' => 'success',
                'message' => 'Gateway added Successfully.'
            ], 200);

        }catch (\Exception $ex) {
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }    

    public function getPaymentGateway($id)
    {
    	try {
            
            $data = PaymentGateway::where('id',$id)->get();

            return response()->json([
                'status'=>'success',
                'data'=> $data,
            ],200);

        } catch(\Exception $ex) {
            return response()->json([
                'status'=>'error',
                'message'=>'Error: '.$ex->getMessage(),
                'error_details'=> 'on line: '.$ex->getLine().'on file: '.$ex->getFile()
            ],200);
        }
    }

    public function getEmailDetails()
    {
    	//return "hello";
    	$driver = config('mail.driver');
    	$host =  config('mail.host');
    	$port = config('mail.port');
    	$username = config('mail.username');
    	$password = config('mail.password');
    	$encryption = config('mail.encryption');

    	return response()->json([
            'driver' => $driver ,
            'host'	=> $host,
            'port'	=> $port,
            'username' => $username,
            'password' => $password,
            'encryption' => $encryption,
        ],200);
    }

    /*public function setEmailDetails(Request $request)
    {
    	config(['mail.driver' => $request->driver]);
       	config(['mail.host' => $request->host]);
    	config(['mail.port' => $request->port]);
    	config(['mail.username'=> $request->username]);
    	config(['mail.password' => $request->password]);
    	config(['mail.encryption'=> $request->encryption]);

    	return config('mail.username');
    	return response()->json([
            'status'=>'success',
            'message' => 'Email Setting saved Successfully'
        ],200);
    }*/

    public function getAllKeys()
    {
    	$apikeys = Api_keys::all();
        /*return response()->json([
            'status' => 'success',
            'data' => $apikeys
            ]);*/
//    	return $apikeys;
    }

    public function getKeysMeta()
    {
        $data = Key_meta::select('id','title')->get();

        return response()->json([
            'status' => 'success',
            'data' => $data
        ]);
    }

    public function addKeysMeta(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title'  => 'required'
            ]);

            if ($validator->fails()) {
                foreach ($validator->messages()->getMessages() as $field_name => $messages){
                    throw new Exception($messages[0], 1);
                }
            }

            $title_key = str_replace(' ','_',strtolower($request->title));
            $addAdmin=Key_meta::firstOrCreate([
                    'title' => $request->title,
                    'title_key' => $title_key
            ]);

            return response()->json([
                'status' => 'success',
                'message' => 'Keys added to the list successfully.'
            ], 200);

        }catch (\Exception $ex) {
            return response()->json([
                'status' => 'error',
                'message' => 'Error : '.$ex->getMessage(),
                'error_details' => 'on line : '.$ex->getLine().' on file : '.$ex->getFile(),
            ], 200);
        }
    }

    public function getKey($id)
    {
        try {
            $findkey = DB::table('api_keys')->where('key_meta_id', $id)->get();
            $response = '';
            foreach ($findkey as $key => $value) {
                $response[$key] = $value[$value];
            }

            return $response;
            return response()->json([
                'status'    => 'success',
                'data'      => $keyarray
            ]);
        }catch(\Exception $ex) {
            return response()->json([
                'status'=>'error',
                'message'=>'Error: '.$ex->getMessage(),
                'error_details'=> 'on line: '.$ex->getLine().'on file: '.$ex->getFile()
            ],200);
        }
    }

    public function addkey(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id'  => 'required'
            ]);

            if ($validator->fails()) {
                foreach ($validator->messages()->getMessages() as $field_name => $messages){
                    throw new Exception($messages[0], 1);
                }
            }
            
            $keymeta = Key_meta::where('id', $request->id)->first();
            if (empty($keymeta)) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Key does not exists'
                ]);
            }

            $apikeys = Api_keys::where('key_meta_id', $request->id)->get();
                      
            if (count($apikeys) == 0) {
                //New Record
                $input = $request->all();
                unset($input['id']);
                foreach ($input as $key => $value) {
                    $savekey = Api_keys::create([
                        'key_meta_id'   => $request->id,
                        'key_title'     => $key,
                        'key_value'     => $value
                    ]);
                }

                return response()->json([
                    'status' => 'success',
                    'message' => 'Key details saved successfully'
                ]);

            }else{
                //Existing record
                $input = $request->all();
                unset($input['id']);
                foreach ($input as $key => $value) {
                    
                    $apikeys = Api_keys::where('key_meta_id', $request->id)
                                ->where('key_title',$key)->first();
                    
                    if (!empty($apikeys)) {
                        $apikeys->key_value = $value;
                        $apikeys->save();

                    }else{
                        $savekey = Api_keys::create([
                            'key_meta_id'   => $keymeta->id,
                            'key_title'     => $key,
                            'key_value'     => $value
                        ]);
                    }
                }

                return response()->json([
                    'status' => 'success',
                    'message' => 'Key details saved successfully'
                ]);

            }

        } catch(\Exception $ex) {
            return response()->json([
                'status'=>'error',
                'message'=>'Error: '.$ex->getMessage(),
                'error_details'=> 'on line: '.$ex->getLine().'on file: '.$ex->getFile()
            ],200);
        }
    }

}
