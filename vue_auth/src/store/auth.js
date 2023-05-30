import axios from "axios";
import {toast} from "vue3-toastify";

export default{
    namespaced:true,
    state: {
        token:null,
        user:null,
    },
    getters: {
        authenticated(state){
            return state.token
        },
        user(state){
            return state.user
        },
    },
    mutations: {
        SET_TOKEN(state,token){
            state.token = token
        },

        SET_USER(state,user){
            state.user = user
        }
    },
    actions: {
        async LoggedIn ({dispatch},credentials) {
            try {
                let response = await axios.post('login',credentials);
                dispatch('attempt',response.data['authorisation']['token']);
                console.log(response.data);
                toast("Login Successfully Done !", {autoClose: 1000});
            }
            catch (error){
                toast("Login Failed !", {autoClose: 1000});
                console.log(error);
            }
        },
        async attempt ({commit,state}, token) {
            if (token){
                commit('SET_TOKEN',token);
            }
            if (!state.token){
                return
            }
            try{
                // let config = {
                //     headers:{
                //         "Authorization":"Bearer "+token
                //     }
                // };
                let response = await axios.post('profile');
                commit('SET_USER',response.data.user);
                console.log(response.data)
            }catch (e) {
                commit('SET_TOKEN',null);
                commit('SET_USER',null);
                console.log(e)
            }
        },

        LoggedOut ({ commit }){
            return axios.post('logout').then(()=>{
                commit('SET_TOKEN',null);
                commit('SET_USER',null);
            })
        }

    },
    modules: {
        //
    }
}