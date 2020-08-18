<template>
  <div class="hero-foot">
    <nav class="tabs is-boxed is-fullwidth">
      <div class="container">
        <ul>
          <li :class="{'is-active': isActive('/')}">
            <router-link to="/">
              <span class="icon">
                <i class="fa fa-home"></i>
              </span>
              <span>Página principal</span>
            </router-link>
          </li>
          <li :class="{'is-active': isActive('cinemas')}">
            <router-link to="/cinemas">
              <span class="icon">
                <i class="fa fa-star"></i>
              </span>
              <span>Cines</span>
            </router-link>
          </li>
          <li :class="{'is-active': isActive('orders')}">
            <router-link to="/orders">
              <span class="icon">
                <i class="fa fa-file-invoice"></i>
              </span>
              <span>Órdenes</span>
            </router-link>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: "AppFooter",
  components: {},
  methods: {
    isActive(path) {
      if (path === "/") {
        return this.$route.name === "Index";
      }

      return this.$route.path.includes(path);
    }
  },
  mounted() {
    
  }
};
</script>