<template>
  <!-- Hero head: will stick at the top -->
  <div class="hero-head">
    <header class="navbar">
      <div class="container">
        <div class="navbar-brand">
          <a href="https://kodoti.com" class="navbar-item">
            <img src="logo.png" alt="KODOTI">
          </a>
        </div>

        <div v-if="$store.state.isAuthenticated" class="navbar-menu">
          <div class="navbar-end">
            <div class="navbar-item">
              <span class="icon">
                <i class="fa fa-user"></i>
              </span>
              <span>
                Hola,
                <b>{{$store.state.user.name}}</b>
              </span>
            </div>
            <span class="navbar-item">
              <button @click="logout" class="button is-danger is-inverted">
                <span class="icon">
                  <i class="fa fa-sign-out-alt"></i>
                </span>
                <span>Desconectarse</span>
              </button>
            </span>
          </div>
        </div>
      </div>
    </header>
  </div>
</template>

<script>
export default {
  name: "AppHeader",
  components: {},
  methods: {
    logout() {
      localStorage.removeItem("kodoti_application");
      this.$store.state.isAuthenticated = false;

      this.$router.push("/login");
    }
  }
};
</script>