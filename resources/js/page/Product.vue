<template>
    <div class="col-md-12 row-grid">
        <list-products :products="products"></list-products>
        <mini-cart></mini-cart>
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
