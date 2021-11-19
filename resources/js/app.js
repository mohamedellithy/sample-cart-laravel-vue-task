/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
import router from './route';
import store from './store';

var randomToken = require('random-token');
window.Vue = require('vue');
axios.defaults.baseURL = 'https://blog.mohamedouf.online/';
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

if (!window.localStorage.getItem('s_token')) {
    window.localStorage.setItem('s_token', randomToken(16));
}
axios.defaults.headers.common['SESSION-TOKEN'] = window.localStorage.getItem('s_token');

store.dispatch('GetCart');


// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('list-products', require('./components/ListProducts.vue').default);
Vue.component('mini-cart', require('./components/MiniCart.vue').default);
Vue.component('cart-list', require('./components/CartList.vue').default);
Vue.component('form-checkout', require('./components/FormCheckout.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    store
});