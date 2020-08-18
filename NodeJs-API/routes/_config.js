let express = require('express'),
    app = express(),
    context = require('./../db/_config'),
    config = require('./../_config')

// Middleware
app.use(express.json());

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
    res.header('Access-Control-Allow-Methods', 'PUT, POST, GET, DELETE, OPTIONS');

    next();
});

app.use((req, res, next) => {
    if (req.path != null && req.method != 'OPTIONS' && (!req.path.includes('auth') && !req.path.includes('static'))) {
        if (req.headers.authorization === undefined || req.headers.authorization != config.access_token) {
            res.status(401).send();
            return;
        }
    }

    next();
});

// Static files
app.use('/static', express.static('static'));

// Default route
app.get('/', (req, res) => {
    res.status(200).send('Running ..');
});

// Register routes
require('./movies')(app, context);
require('./cinemas')(app, context);
require('./auth')(app, context);
require('./schedules')(app, context);
require('./orders')(app, context);

module.exports = app;