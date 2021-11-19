<template>
    <div class="mini-cart">
         <router-link to="/cart" tag="span" class="count-cart">{{ this.$store.state.cart_count }}</router-link>
         <p class="total-cart">$ {{ this.$store.state.cart_total }}  <i class="fas fa-shopping-cart"></i> </p>
         <router-link to="/cart" class="btn btn-success checkout" tag="button"> CHECKOUT </router-link>
    </div>
</template>
