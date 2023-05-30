<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 mt-5">
                <div class="card p-3">
                    <h3 class="text-center">Login Page</h3>
                    <form @submit.prevent="submit">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" v-model="form.email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" v-model="form.password">
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import {mapActions, mapGetters} from "vuex";
    import {toast} from "vue3-toastify";
    export default {
        name: "LoginView",
        data () {
            return{
                form:{
                    email:'',
                    password:''
                }
            }
        },
        computed:{
            ...mapGetters({
                authenticated:"auth/authenticated",
                user:"auth/user",
            })
        },
        methods:{
            ...mapActions({
                LoggedIn:'auth/LoggedIn'
            }),

             submit () {
                 this.LoggedIn(this.form).then(()=>{
                     this.$router.replace({
                         name:'HomeView'
                     });
                 }).catch(()=>{
                     toast("Login Failed !", {autoClose: 1000});
                     console.log("Login Failed")
                 })
            }
        }
    }
</script>

<style scoped>

</style>