<template>
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
</template>

<script>
import Axios from "axios";

export default {
  name: "login",
  data() {
    return {
      email: "eduardo@kodoti.com",
      password: "123456",
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
            this.$services.authService.prepare(r.data.access_token);
            this.$parent.step = "catalog";
            this.$parent.userId = r.data.result.id;
          }
        });
    }
  }
};
</script>