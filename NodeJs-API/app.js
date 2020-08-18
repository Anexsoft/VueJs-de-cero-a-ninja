let express = require('express'),
    config = require('./_config'),
    app = require('./routes/_config');

app.listen(config.port, () => {
    console.log(`server running on port ${config.port}`)
});