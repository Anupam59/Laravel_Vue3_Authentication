<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 mt-5">
                <div class="card p-3">
                    <h3 class="text-center">Register Page</h3>
                    <form @submit.prevent="register">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" v-model="RegisterForm.name">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" v-model="RegisterForm.email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" v-model="RegisterForm.password">
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import axios from "axios";
    import {toast} from "vue3-toastify";
    export default {
        name: "RegisterView",
        data () {
            return{
                RegisterForm:{
                    name:'',
                    email:'',
                    password:''
                }
            }
        },
        methods:{

            async register () {
                await axios.post('register',this.RegisterForm).then((response)=>{
                    console.log(response.data);
                    toast("Register Successfully !", {autoClose: 1000});
                    this.$router.replace({
                        name:'LoginView'
                    });
                }).catch((e)=>{
                    console.log(e)
                });
            }
        }
    }
</script>

<style scoped>

</style>