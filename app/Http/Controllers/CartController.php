<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\CartResource;
use Session;
use App\Cart;
class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $Cart_data = self::get_cart_content($request->header('Session-Token'));
        return new CartResource($Cart_data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //

        $cart_items = self::get_cart_content($request->header('Session-Token'));

        # if cart is empty
        if(empty($cart_items)):
            $cart['items'][]    = $request->only(['id','name','quantity','price']);
            $cart['sub_total']  = $request->price;
        else:
            $item = $request->only(['id','name','quantity','price']);

            #check if cart have this item
            $cart['items'] = collect($cart_items['items'])->map(function($value,$key) use (&$item) {
                if($value['id'] == $item['id']){
                    # if cart have item increament quanttity by one only
                    $value['quantity']   += 1;
                    $item['added']        = true;
                }

                return $value;
            });

            #check if item added to cart or not if not add new item in cart
            if(!isset($item['added'])){
               $cart['items'][] = $request->only(['id','name','quantity','price']);
            }

            #sum total in cart and subtotal
            $cart['sub_total']  = collect($cart['items'])->sum(function($row){
                return $row['price'] * $row['quantity'];
            });

        endif;

        $cart['tax']        = 10;
        $cart['total']      = $this->calculate_total($cart['sub_total'],$cart['tax']);

        self::put_cart_content($request->header('Session-Token'),$cart);

        return new CartResource($cart);
    }

    public function calculate_total($subtotal,$tax){
       return $subtotal - ( ($subtotal * $tax) / 100);
    }

    public static function get_cart_content($token){
        $Cart_content = Cart::where(['token_cart'=>$token])->first();
        return $Cart_content ? $Cart_content->content : [];
    }

    public static function put_cart_content($token,array $content){
         if(Cart::where(['token_cart'  =>$token])->exists()){
             return self::update_cart_content($token,$content);
         }

          return self::add_cart_content($token,$content);
    }

    public static function add_cart_content($token,array $content){
        $Cart_content = Cart::create([
            'token_cart'  =>$token,
            'content'=>$content
        ]);
        return $Cart_content;
    }

    public static function forget_cart_content($token){
        $Cart_content = Cart::where(['token_cart'  =>$token])->delete();
        return $Cart_content;
    }

    public static function update_cart_content($token,array $content){
        $Cart_content = Cart::where(['token_cart'  =>$token])->update([
            'content'=>$content
        ]);
        return $Cart_content;
    }
}
