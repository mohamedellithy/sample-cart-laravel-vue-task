@component('mail::message')
# Successfully Order is created 

Order Number :  {{ $order->id }} <br/>
The body of your message. 
The body of your message. <br/>
Amount {{ $order->total }}$
@component('mail::button', ['url' => url('thank-you/'.$order->id)])
  view Invoice 
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
