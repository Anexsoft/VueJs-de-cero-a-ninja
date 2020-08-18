import Axios from 'axios'
import authService from './AuthService.js';
import cinemaService from './CinemaService.js';
import orderService from './OrderService.js';
import movieService from './MovieService.js';
import scheduleService from './ScheduleService.js';

// Axios Configuration
Axios.defaults.headers.common.Accept = 'application/json';

export default {
    authService: new authService(Axios, window.baseUrl),
    cinemaService: new cinemaService(Axios, window.baseUrl),
    orderService: new orderService(Axios, window.baseUrl),
    movieService: new movieService(Axios, window.baseUrl),
    scheduleService: new scheduleService(Axios, window.baseUrl)
}