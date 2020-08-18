import Vue from 'vue';
import VueRouter from 'vue-router';
import Vuex from 'vuex';
import App from './App.vue';
import routes from './routes/index';
import storeIndex from './store/index';
import services from './services/_index';

Vue.config.productionTip = false;

// Global logic methods
Vue.use({
  install(Vue) {
    Object.defineProperty(Vue.prototype, '$services', {
      value: services
    })
  }
})

// Router config
Vue.use(VueRouter);
let router = new VueRouter({
  routes
});

// Use Vuex
Vue.use(Vuex);
let store = new Vuex.Store(storeIndex);

router.beforeEach((to, from, next) => {
  if (!store.state.isAuthenticated && !to.path.includes('/login')) {
    next({ path: '/login' });
    return;
  }

  next();
});

// Filters
Vue.filter('currency', (value) => {
  if (typeof (value) === 'string') {
    value = parseFloat(value);
  }

  return value.toLocaleString('es-US', { style: 'currency', currency: 'USD' });
})

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app');