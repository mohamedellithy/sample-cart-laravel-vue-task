<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe;
use Illuminate\Support\Facades\Validator;
class StripeController extends Controller
{
    public static function payment_process(Request $request){
        $validator = Validator::make($request->all(),[
            'card_no' => 'required',
            'expiry_month_year' => 'required|date_format:m/Y',
            'cvv' => 'required',
        ]);

        if ($validator->fails()) {
            return [
             'status' => 'failed',
             'errors' =>$validator->errors()
            ];
        }

        $stripe = Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        
        try {
            $expire_data = explode('/',$request->input('expiry_month_year'));
            $response = \Stripe\Token::create(array(
                "card" => array(
                    "number"    => $request->input('card_no'),
                    "exp_month" => $expire_data[0],
                    "exp_year"  => $expire_data[1],
                    "cvc"       => $request->input('cvv')
                )));

            if (!isset($response['id'])) {
                return redirect()->route('addmoney.paymentstripe');
            }

            $charge = \Stripe\Charge::create([
                'card' => $response['id'],
                'currency' => $request->input('currency'),
                'amount' =>  $request->input('total') * 100,
                'description' => 'wallet',
            ]);

            return $charge;

        }
        catch (Exception $e) {
            return $e->getMessage();
        }

    }
}
