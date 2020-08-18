<template>
  <div>
    <h1 class="title">{{ isUpdate ? model.name : 'Nuevo registro' }}</h1>
    <h2 class="subtitle">{{ isUpdate ? 'Formulario de actualización' : 'Formulario de creación' }}</h2>

    <div v-if="loading" class="fa-3x has-text-centered">
      <i class="fas fa-spinner fa-spin"></i>
    </div>

    <div v-if="isUpdate" class="tabs is-boxed">
      <ul>
        <li :class="{'is-active': tab === 'info'}">
          <a @click="tab = 'info'">Información</a>
        </li>
        <li :class="{'is-active': tab === 'schedule'}">
          <a @click="tab = 'schedule'">Horarios</a>
        </li>
      </ul>
    </div>

    <!-- information -->
    <form v-if="!loading && tab === 'info'" @submit.prevent="save" class="box">
      <div class="field">
        <label>Nombre</label>
        <input
          v-model="model.name"
          class="input"
          required
          type="text"
          placeholder="Ingrese el nombre"
        >
      </div>
      <div class="field">
        <label>Precio</label>
        <input
          v-model="model.price"
          class="input"
          required
          type="number"
          placeholder="Ingrese su contraseña"
        >
      </div>
      <div class="field">
        <button class="button is-primary" type="submit">Guardar</button>
      </div>
    </form>

    <!-- schedules -->
    <div v-if="!loading && tab === 'schedule'" class="box">
      <table class="table is-fullwidth">
        <thead>
          <tr>
            <th>Película</th>
            <th style="width:150px;">Horario</th>
            <th style="width:150px;" class="has-text-right">Creado</th>
            <th style="width:150px;" class="has-text-right">Actualizado</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="schedule in schedules" :key="schedule.id">
            <td>{{schedule.movie.name}}</td>
            <td>{{schedule.time}}</td>
            <td class="has-text-right">{{schedule.createdAt}}</td>
            <td class="has-text-right">{{schedule.updatedAt}}</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="2">
              <div class="select is-fullwidth">
                <select v-model="newSchedule.movieId">
                  <option v-for="movie in movies" :key="movie.id" :value="movie.id">{{movie.name}}</option>
                </select>
              </div>
            </td>
            <td>
              <div class="select is-fullwidth">
                <select v-model="newSchedule.time">
                  <option value="12:00:00">12:00:00</option>
                  <option value="14:00:00">14:00:00</option>
                  <option value="16:00:00">16:00:00</option>
                  <option value="18:00:00">18:00:00</option>
                </select>
              </div>
            </td>
            <td>
              <button @click="addSchedule" class="button is-primary is-fullwidth">Agregar</button>
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: "CreateOrUpdate",
  data() {
    return {
      tab: "info",
      loading: false,
      model: {
        name: "",
        price: 0
      },
      schedules: [],
      movies: [],
      newSchedule: {
        movieId: null,
        cinemaId: null,
        time: null
      }
    };
  },
  computed: {
    isUpdate() {
      return this.$route.params.id != undefined;
    }
  },
  methods: {
    getMovies() {
      this.$services.movieService
        .getAll()
        .then(r => {
          this.movies = r.data;
        })
        .catch(() => {
          console.error("Algo salió mal ..");
        });
    },
    get(id) {
      this.loading = true;
      this.$services.cinemaService
        .get(id)
        .then(r => {
          this.model.name = r.data.name;
          this.model.price = r.data.price;
          this.schedules = r.data.schedules;

          this.newSchedule.cinemaId = id;

          this.loading = false;
        })
        .catch(() => {
          console.error("Algo salió mal ..");
        });
    },
    save() {
      this.loading = true;

      if (this.isUpdate) {
        this.$services.cinemaService
          .update(this.$route.params.id, this.model)
          .then(() => {
            this.loading = false;
          })
          .catch(() => {
            console.error("Algo salió mal ..");
          });
      } else {
        this.$services.cinemaService
          .create(this.model)
          .then(() => {
            this.$router.push("/cinemas");
          })
          .catch(() => {
            console.error("Algo salió mal ..");
          });
      }
    },
    addSchedule() {
      this.loading = true;
      this.$services.scheduleService
        .create(this.newSchedule)
        .then(r => {
          this.loading = false;
          this.get(this.$route.params.id);
        })
        .catch(() => {
          console.error("Algo salió mal ..");
        });
    }
  },
  mounted() {
    if (this.isUpdate) {
      this.get(this.$route.params.id);
      this.getMovies();
    }
  }
};
</script>