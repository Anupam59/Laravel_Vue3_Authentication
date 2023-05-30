<template>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">TODO PROJECT</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <template v-if="authenticated">
                        <li class="nav-item">
                            <router-link to="/" class="nav-link active">Dashboard</router-link>
                        </li>

                    </template>

                </ul>

                <div class="d-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                        <template v-if="!authenticated">
                            <li class="nav-item">
                                <router-link to="/login" class="nav-link active">Login</router-link>
                            </li>

                            <li class="nav-item">
                                <router-link to="/register" class="nav-link">Register</router-link>
                            </li>
                        </template>

                        <li class="nav-item" v-if="user">
                            <router-link to="/profile" class="nav-link">{{ user.name }}</router-link>
                        </li>

                        <template v-if="authenticated">
                            <li class="nav-item">
                                <a href="#" @click.prevent="logout" class="nav-link">Logout</a>
                            </li>
                        </template>

                    </ul>
                </div>

            </div>
        </div>
    </nav>
</template>

<script>
    import {mapActions, mapGetters} from "vuex";
    import {toast} from "vue3-toastify";

    export default {
        name: "NavBar",
        computed:{
            ...mapGetters({
                authenticated:"auth/authenticated",
                user:"auth/user",
            })
        },
        methods: {
            ...mapActions({
                LoggedOut: 'auth/LoggedOut'
            }),

            logout () {
                this.LoggedOut().then(()=>{
                    toast("Logout Successfully Done !", {autoClose: 1000});
                    this.$router.replace({
                        name:'LoginView'
                    })
                })
            }
        }
    }
</script>

<style scoped>

</style>