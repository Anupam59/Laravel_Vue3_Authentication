<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 mt-5">
                <div class="card p-3">
                    <h3 class="text-center mb-5">My Profile Page</h3>
                    <p>Name : {{ user.name}}</p>
                    <p>Email : {{ user.email}}</p>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        name: "ProfileView",
        computed:{
            ...mapGetters({
                user:"auth/user",
            })
        },
    }
</script>

<style scoped>

</style>