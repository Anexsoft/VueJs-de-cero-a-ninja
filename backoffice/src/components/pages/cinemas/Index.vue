<template>
  <div>
    <h1 class="title">Cines</h1>
    <h2 class="subtitle">Visualizando los cines</h2>

    <div class="field has-text-right">
      <a href="/#/cinemas/create" class="button is-primary is-medium">
        <span class="icon">
          <i class="fa fa-plus"></i>
        </span>
        <span>Crear nuevo</span>
      </a>
    </div>

    <table class="table is-fullwidth">
      <thead>
        <tr>
          <th>Nombre</th>
          <th style="width:100px;" class="has-text-right">Precio</th>
          <th style="width:150px;" class="has-text-right">Creación</th>
          <th style="width:150px;" class="has-text-right">Actualización</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items" :key="item.id">
          <td>
            <router-link class="has-text-link" :to="`/cinemas/${item.id}/update`">
              {{item.name}}
            </router-link>
          </td>
          <td class="has-text-right">{{item.price | currency}}</td>
          <td class="has-text-right">{{item.createdAt}}</td>
          <td class="has-text-right">{{item.updatedAt}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "CinemaIndex",
  data() {
    return {
      items: []
    };
  },
  methods: {
    getAll() {
      this.$services.cinemaService
        .getAll()
        .then(r => {
          this.items = r.data;
        })
        .catch(r => {
          console.error(r);
          console.error("Algo salió mal");
        });
    }
  },
  mounted() {
    this.getAll();
  }
};
</script>