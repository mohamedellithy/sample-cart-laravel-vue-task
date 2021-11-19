<template>
    <div class="col-md-12">
        <cart-list :cart_items="cart_items"></cart-list>
    </div>
</template>
<script>
export default {
    data(){
        return{
           cart_items:{}
        }
    },
    mounted(){
        let self = this;
        axios.get('api/carts').then(function(response){
           self.cart_items = response.data.data;
        }).catch(function(error){});
    }
}
</script>
