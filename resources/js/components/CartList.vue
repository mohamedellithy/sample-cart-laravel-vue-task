<template>
    <div class="cart">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">item</th>
                    <th scope="col">Unit Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Line Total</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item,index) in cart_items.items" :key="item.id" class="item-list">
                    <td>{{ item.name }}</td>
                    <td>${{ item.price }}</td>
                    <td>{{ item.quantity }}</td>
                    <td>${{ item.price * item.quantity }}</td>
                </tr>
                <tr>
                    <td colspan="3">SUB TOTAL</td>
                    <td colspan="1"> ${{ cart_items.sub_total }} </td>
                </tr>
                <tr>
                    <td colspan="3">Tax {{ cart_items.tax }}%</td>
                    <td colspan="1"> {{ ( Number(cart_items.tax) * cart_items.sub_total ) / 100  }} </td>
                </tr>
                <tr>
                    <td colspan="3">Total</td>
                    <td colspan="1"> {{ cart_items.total }} </td>
                </tr>
            </tbody>
        </table>
        <div class="footer-cart">
             <router-link to="/checkout" class="btn btn-success checkout" tag="button"> CHECKOUT </router-link>
             <router-link to="/" tag="i" class="fas fa-long-arrow-alt-right"></router-link>
        </div>
    </div>
</template>
<script>
export default {
    props:{
        cart_items:{}
    },
    methods:{

    }
}
</script>
