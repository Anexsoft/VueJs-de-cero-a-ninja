<template>
  <div>
    <h1 class="title">Órdenes</h1>
    <h2 class="subtitle">Visualizando las órdenes</h2>

    <table class="table is-fullwidth">
      <thead>
        <tr>
          <th style="width:100px;"></th>
          <th>Cinema</th>
          <th class="has-text-right">Horario</th>
          <th style="width:100px;" class="has-text-right">Ingreso</th>
          <th style="width:150px;" class="has-text-right">Creación</th>
          <th style="width:150px;" class="has-text-right">Actualización</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items" :key="item.id">
          <td># {{item.id | pad}}</td>
          <td>{{item.schedule.cinema.name}}</td>
          <td class="has-text-right">{{item.schedule.time}}</td>
          <td class="has-text-right">{{item.total | currency}}</td>
          <td class="has-text-right">{{item.createdAt}}</td>
          <td class="has-text-right">{{item.updatedAt}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "OrderIndex",
  data() {
    return {
      items: []
    };
  },
  methods: {
    getAll() {
      this.$services.orderService
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
  },
  filters: {
    pad(value) {
      let s = String(value);

      while (s.length < 4) {
        s = "0" + s;
      }
      return s;
    }
  }
};
</script>