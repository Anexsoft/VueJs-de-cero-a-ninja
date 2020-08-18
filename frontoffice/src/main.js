import Vue from 'vue'
import App from './App.vue'
import services from './services/_index'

Vue.config.productionTip = false

// Global logic methods
Vue.use({
  install(Vue) {
    Object.defineProperty(Vue.prototype, '$services', {
      value: services
    })
  }
})

// Filters
Vue.filter('currency', (value) => {
  return value.toLocaleString('es-US', { style: 'currency', currency: 'USD' });
})

new Vue({
  render: h => h(App),
}).$mount('#app')
