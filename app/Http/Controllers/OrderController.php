<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Session;
use App\Order;
class OrderController extends Controller
{
    //

    public function complete_order(Request $request){
        $request->merge([
            'total'    => $this->get_order_total($request),
            'currency' => $this->get_order_currency()
        ]);

        $callback = StripeController::payment_process($request);
        if($callback['status'] == 'succeeded'){

            CartController::forget_cart_content($request->header('Session-Token'));

            $order = Order::create([
                'total'          => ($callback['amount'] / 100),
                'transaction_id' => $callback['id'],
            ]);


            # try{
            #     \Mail::to($request->input('email'))->send(new \App\Mail\InvoicesMail($order));
            # }catch(Exception $e){
            #     return response()->json([
            #         'errors' => $e->getMessage()
            #     ],403);
            # }


            return response()->json([
                'status'  => $callback['status'],
                'message' => 'Payment succeeded '
            ]);
        }

        return response()->json([
            'errors' => $callback
        ],403);
    }

    public function get_order_total(Request $request){
        $cart_items = CartController::get_cart_content($request->header('Session-Token'));
        if(!empty($cart_items)){
            return $cart_items['total'];
        }

        return 0;
    }

    public function get_order_currency(){
        return 'USD';
    }
}
