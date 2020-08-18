import pageDefault from './../components/pages/Default';
import cinemaIndex from './../components/pages/cinemas/Index';
import cinemaCreate from './../components/pages/cinemas/CreateOrUpdate';
import cinemaUpdate from './../components/pages/cinemas/CreateOrUpdate';
import orderIndex from './../components/pages/Orders';
import login from './../components/pages/Login';

export default [
    { path: '/', name: 'Index', component: pageDefault },
    { path: '/cinemas', name: 'CinemaIndex', component: cinemaIndex },
    { path: '/cinemas/create', name: 'CinemaCreate', component: cinemaCreate },
    { path: '/cinemas/:id/update', name: 'CinemaUpdate', component: cinemaUpdate },
    { path: '/orders', name: 'OrderIndex', component: orderIndex },
    { path: '/login', name: 'Login', component: login },
];