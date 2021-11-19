<template>
    <div class="row">
        <div v-for="product in products" :key="product.id" class="col-md-4">
            <div class="card p-3">
                <div class="d-flex flex-row mb-3">
                    <div class="col-md-12 container-product-info">
                        <div class="name-product">
                            <h4>{{ product.name }}</h4>
                        </div>
                        <div class="price-product">
                            <strong>{{ product.price }}</strong>
                            <i @click="addToCart(product)" class="fas fa-plus"></i>
                        </div>
                    </div>
                </div>
                <h6 class="description-product">{{ product.description }}</h6>
            </div>
        </div>
    </div>
</template>
<script>
import { mapMutations } from 'vuex'
export default {
    props:{
        products:{}
    },
    methods:{
        ...mapMutations([
        'cart_count_increment'
        ]),
        addToCart:function(item){
            let self = this;
            item.quantity--;
            this.$store.commit('cart_count_increment');
            item.quantity = 1;
            axios.post('api/carts',item).then(function(response){
              self.$store.commit('SET_Cart_total',response.data.data);
            }).catch(function(error){});
        }
    }
}
</script>
