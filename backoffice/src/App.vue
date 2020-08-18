<template>
  <div id="app">
    <section class="hero is-light is-bold is-fullheight">
      <app-header></app-header>

      <!-- Hero content: will be in the middle -->
      <div class="hero-body">
        <div class="container">
          <router-view></router-view>
        </div>
      </div>

      <app-footer v-if="$store.state.isAuthenticated"></app-footer>
    </section>
    <footer class="footer">
      <div class="container has-text-centered is-size-4">
        <p>
          Proyecto realizado por
          <a href="https://kodoti.com">KODOTI</a>.
        </p>
      </div>
    </footer>
  </div>
</template>

<script>
import AppHeader from "./components/AppHeader.vue";
import AppFooter from "./components/AppFooter.vue";

export default {
  name: "app",
  components: {
    AppHeader,
    AppFooter
  }
};
</script>