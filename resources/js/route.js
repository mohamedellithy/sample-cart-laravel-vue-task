window.Vue = require('vue');

import ListProducts from "./page/Product";
import CartItems from "./page/Cart";
import Checkout from "./page/Checkout";
import thankYou from './page/Thankyou';

import VueRouter from 'vue-router';
Vue.use(VueRouter);


const routes = [{
        path: '/',
        name: 'products',
        component: ListProducts,
    },
    {
        path: '/cart',
        name: 'cart',
        component: CartItems,
    },
    {
        path: '/checkout',
        name: 'checkout',
        component: Checkout,
    },
    {
        path: '/thank-you',
        name: 'thankYou',
        component: thankYou,
    }
];

const router = new VueRouter({
    mode: 'history',
    routes,
    base: '/',
});



export default router;
