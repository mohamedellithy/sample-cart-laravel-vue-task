<template>
    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h6 class="heading-form"> Stripe Online Payment  </h6>
                    <p class="alert alert-danger" v-for="(error,index) in errors" :key="index">
                       {{ error[0] }}
                    </p>
                    <p class="alert alert-danger" v-for="(validate,index) in validates" :key="index">
                       {{ validate }}
                    </p>
                    <form @submit.prevent="checkoutOrder()" data-cc-on-file="false" data-stripe-publishable-key="pk_test_iS5sLGz5CONWxJ8KHhBzHHvD" name="frmStripe" id="frmstripe" method="post">
                        <div class="row">
                            <div class="col-lg-12 form-group">
                                <input v-model="fields.email" autocomplete="off" placeholder="Email" class="form-control"  type="email" name="email" required> 
                            </div>
                        </div>       
                        <div class="row">
                            <div class="col-lg-12 form-group">
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <input v-model="fields.card_no" :class="[ fields.card_no.length > 20 ? 'error' : 'success']" autocomplete="off" placeholder="Card Number" class="form-control card-no" size="20" type="text" name="card_no" required> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input v-model="fields.expiry_month_year" class="form-control expiry-month-year" placeholder="MM / YY" size="5" type="text" name="expiry_month_year" required>
                                        </td>
                                        <td>
                                            <input  v-model="fields.cvv" :class="[ fields.cvv.length != 3 && fields.cvv.length != 0 ? 'error' : 'success']" autocomplete="off" class="form-control cvv" placeholder="CVV" size="3" type="text" name="cvv" required>
                                        </td>
                                    </tr>
                                </table>
                                <button type="submit" class="btn btn-primary">Pay with Card ${{ this.$store.state.cart_total }} </button>
                            </div>
                        </div>
                    </form>
                </div> 
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            fields:{
                email:'',
                card_no:'',
                expiry_month_year:'',
                cvv:''
            },
            errors:{},
            validates:{}
        }
    },
    methods:{
        checkoutOrder:function(){
            let self = this;
            axios.post('api/checkout-order',this.fields).then(function(response){
                if(response.data.status == 'succeeded'){
                    self.$router.replace({name:'thankYou'});
                }
            }).catch(function(error){
                self.errors = error.response.data.errors.errors;
                console.log(self.errors);
            });
        }
    }

}
</script>