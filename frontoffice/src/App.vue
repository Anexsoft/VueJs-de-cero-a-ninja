<template>
  <div id="app">
    <section class="hero is-light is-bold is-fullheight">
      <div class="hero-body">
        <div class="container">
          <h1 class="title">KODOTI Cinema FrontOffice</h1>
          <h2 class="subtitle">Compra tu entrada aquí mismo.</h2>

          <login v-if="step === 'login'"></login>
          <catalog v-if="step === 'catalog'" :user-id="userId"></catalog>

          <p v-if="step === 'completed'">Gracias por tu compra ..</p>
        </div>
      </div>
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
import login from "./components/Login.vue";
import catalog from "./components/Catalog.vue";

export default {
  name: "app",
  data() {
    return {
      step: "login",
      userId: null
    };
  },
  components: {
    login,
    catalog
  },
  mounted() {}
};
</script>