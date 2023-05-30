import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CreatePart from '../views/CreatePart.vue'
import UpdatePart from '../views/UpdatePart.vue'
import LoginView from "@/views/LoginView";
import ProfileView from "@/views/ProfileView";
import store from "@/store";
import RegisterView from "@/views/RegisterView";

const routes = [
  {
    path: '/',
    name: 'HomeView',
    component: HomeView
  },

  {
    path: '/create',
    name: 'CreatePart',
    component: CreatePart
  },

  {
    path: '/update/:todoid',
    name: 'UpdatePart',
    component: UpdatePart
  },

  {
    path: '/profile',
    name: 'ProfileView',
    component: ProfileView,
  },
  {
    path: '/login',
    name: 'LoginView',
    component: LoginView,
    beforeEnter:(to, from, next)=>{
      if (store.getters['auth/authenticated']){
        next('/');
      }
      next();
    }
  },
  {
    path: '/register',
    name: 'RegisterView',
    component: RegisterView,
    beforeEnter:(to, from, next)=>{
      if (store.getters['auth/authenticated']){
        next('/');
      }
      next();
    }
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

router.beforeEach((to, from, next) => {
  const publicPages = ['/login','/register'];
  const authRequired = !publicPages.includes(to.path);
  // const loggedIn = localStorage.getItem('user');
  const loggedIn = store.getters['auth/authenticated'];
  if (authRequired && !loggedIn) {
    next('/login');
  }
  else {
    next();
  }
});

export default router
