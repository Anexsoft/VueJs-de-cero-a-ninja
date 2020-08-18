<template>
  <div>
    <h1 class="title">Acceso al sitema</h1>
    <h2 class="subtitle">Ingrese sus credenciales</h2>

    <div class="columns">
      <div class="column is-6">
        <form @submit.prevent="login" class="box">
          <div class="field">
            <label>Correo</label>
            <input
              v-model="email"
              class="input"
              required
              type="email"
              placeholder="Ingrese su correo"
            >
          </div>
          <div class="field">
            <label>Contraseña</label>
            <input
              v-model="password"
              class="input"
              required
              type="password"
              placeholder="Ingrese su contraseña"
            >
            <p v-if="error" class="help has-text-danger">{{error}}</p>
          </div>
          <div class="field">
            <button class="button is-primary is-rounded is-medium" type="submit">Ingresar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      password: "123456",
      email: "eduardo@kodoti.com",
      error: null
    };
  },
  components: {},
  methods: {
    login() {
      this.$services.authService
        .login({
          email: this.email,
          password: this.password
        })
        .then(r => {
          if (!r.data.isSuccess) {
            this.error = r.data.message;
          } else {
            // store in localstorage
            localStorage.setItem(
              "kodoti_application",
              JSON.stringify({
                access_token: r.data.access_token,
                user: r.data.result
              })
            );

            // prepare
            this.prepareAndRedirect(r.data.access_token, r.data.result);
          }
        });
    },
    prepareAndRedirect(token, user) {
      // Set token to axios
      this.$services.authService.prepare(token);

      // set authenticated as true
      this.$store.state.isAuthenticated = true;
      this.$store.state.user = user;

      // redirect
      this.$router.push("/");
    }
  },
  mounted() {
    if (localStorage.getItem("kodoti_application")) {
      let jsonObject = JSON.parse(localStorage.getItem("kodoti_application"));

      this.prepareAndRedirect(jsonObject.access_token, jsonObject.user);
    }
  }
};
</script>