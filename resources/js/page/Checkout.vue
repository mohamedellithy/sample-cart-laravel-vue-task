<template>
    <div class="col-md-12 row-grid">
        <div class="row-checkout">
            <h3> 
               <span> CHECKOUT </span> 
            </h3>
            <div class="col-md-8 description-checkout">
                 YOUR PERSONAL AND FINANCIAL INFORMATION ARE TRANSIMATED OVER SSL SECURED CONNECTION 
                 USING 256 BIT BANK LEVEL ENCRYPTION 
            </div>
            <div class="col-md-8 container-pay-buttons">
                <button v-if="this.$store.state.cart_count != 0 " data-toggle="modal" data-target="#exampleModalCenter" class="btn pay-with-strip-btn"> Pay with Stripe Checkout </button>
                <div class="container-payment-images">
                    <img class="image-payment-method" :src="require('../assets/img/visa.jpg')"/>
                    <img class="image-payment-method" :src="require('../assets/img/am-ex.png')"/>
                    <img class="image-payment-method" :src="require('../assets/img/discovery.png')"/>
                    <img class="image-payment-method" :src="require('../assets/img/master.jpg')"/>
                </div>
            </div>
        </div>
        <form-checkout v-if="this.$store.state.cart_count != 0 "></form-checkout>
    </div>
</template>
<script>
export default {
    data(){
        return{
           products:{}
        }
    },
    mounted(){
        let self = this;
        axios.get('api/products').then(function(response){
           self.products = response.data.data;
        }).catch(function(error){});
    }
}
</script>
