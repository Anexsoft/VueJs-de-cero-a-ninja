<template>
  <div>
    <div v-if="loading" class="fa-3x has-text-centered">
      <i class="fas fa-spinner fa-spin"></i>
    </div>

    <div v-else>
      <div class="box">
        <div class="columns">
          <div class="column">
            <div class="field">
              <div class="control is-expanded">
                <div class="select is-fullwidth is-medium is-rounded">
                  <select v-model="cinemaId">
                    <option disabled :value="null">Seleccione un cine</option>
                    <option
                      v-for="cinema in cinemas"
                      :value="cinema.id"
                      :key="cinema.id"
                    >{{cinema.name}}</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="box">
        <div class="columns">
          <div class="column">
            <div class="field">
              <div class="control is-expanded">
                <div class="select is-fullwidth is-medium is-rounded">
                  <select v-model="order.quantity">
                    <option disabled :value="null">Elija la cantidad de entradas</option>
                    <option :value="1">Una entrada</option>
                    <option :value="2">Dos entradas</option>
                    <option :value="3">Tres entradas</option>
                    <option :value="4">Cuatro entradas</option>
                    <option :value="5">Cinco entradas</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="column has-text-right">
            <div class="title">
              <small class="has-text-grey">TOTAL</small>
              {{total | currency}}
            </div>
          </div>
        </div>
      </div>

      <div class="columns is-multiline">
        <div v-for="movie in catalog" :key="movie.id" class="column is-3">
          <div class="card">
            <div class="card-image">
              <figure class="image is-4by3">
                <img :src="movie.image" alt="Placeholder image">
              </figure>
            </div>
            <div class="card-content">
              <div class="title is-size-6">{{movie.name}}</div>
              <div class="subtitle has-text-grey is-size-7">{{movie.description}}</div>
              <div class="field">
                <div class="control is-expanded">
                  <div class="select is-fullwidth is-rounded">
                    <select v-model="order.scheduleId">
                      <option selected :value="null">Horarios</option>
                      <option
                        v-for="item in getSchedule(movie.id)"
                        :key="item.id"
                        :value="item.id"
                      >{{item.time}}</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="field">
        <button @click="save" :disabled="!isReady" class="button is-primary is-fullwidth is-large">
          <span class="icon">
            <i class="fa fa-shopping-cart"></i>
          </span>
          <span>Generar compra</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "catalog",
  props: {
    userId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      cinemas: [],
      movies: [],
      cinemaId: null,
      loading: false,
      order: {
        scheduleId: null,
        quantity: null
      }
    };
  },
  computed: {
    catalog() {
      if (this.cinemaId === null) return [];

      let cinema = this.cinemas.find(x => x.id == this.cinemaId);
      let ids = cinema.schedules.map(x => x.movieId);

      return this.movies.filter(x => ids.includes(x.id));
    },
    total() {
      if (this.order.quantity === null) return 0;
      return (
        this.cinemas.find(x => x.id == this.cinemaId).price *
        this.order.quantity
      );
    },
    isReady() {
      return this.order.scheduleId != null && this.order.quantity != null;
    }
  },
  components: {},
  methods: {
    getSchedule(movieId) {
      let schedules = this.cinemas.find(x => x.id == this.cinemaId).schedules;
      return schedules.filter(x => x.movieId === movieId);
    },
    save() {
      let self = this;

      let order = {
        quantity: self.order.quantity,
        scheduleId: self.order.scheduleId,
        userId: self.userId
      };

      this.loading = true;

      this.$services.orderService.create(order).then(() => {
        this.$parent.step = "completed";
      }).catch(() => {
        this.loading = false;
      });
    }
  },
  mounted() {
    this.$services.cinemaService.getAll().then(r => {
      this.cinemas = r.data;
    });

    this.$services.movieService.getAll().then(r => {
      this.movies = r.data;
    });
  }
};
</script>