let config = require('./../_config'),
    Sequelize = require('sequelize');

// Instance Database
let sequelize = new Sequelize(config.database.database, config.database.user, config.database.password, {
    host: config.database.host,
    dialect: 'mysql'
});

// Model definition
let model = {
    Movies: sequelize.define('movies', {
        id: { type: Sequelize.INTEGER, primaryKey: true },
        image: Sequelize.STRING,
        name: Sequelize.STRING,
        description: Sequelize.STRING
    }),
    Schedules: sequelize.define('schedules', {
        id: { type: Sequelize.INTEGER, primaryKey: true },
        movieId: Sequelize.INTEGER,
        cinemaId: Sequelize.INTEGER,
        time: Sequelize.STRING
    }),
    Cinemas: sequelize.define('cinemas', {
        id: { type: Sequelize.INTEGER, primaryKey: true },
        name: Sequelize.STRING,
        price: Sequelize.DECIMAL(10, 2)
    }),
    Orders: sequelize.define('orders', {
        id: { type: Sequelize.INTEGER, primaryKey: true },
        userId: Sequelize.INTEGER,
        scheduleId: Sequelize.INTEGER,
        quantity: Sequelize.INTEGER,
        total: Sequelize.DECIMAL(10, 2)
    }),
    Users: sequelize.define('users', {
        id: { type: Sequelize.INTEGER, primaryKey: true },
        name: Sequelize.STRING,
        email: Sequelize.STRING,
        password: Sequelize.STRING
    })
};

// Relationships
model.Cinemas.hasMany(model.Schedules);
model.Cinemas.hasMany(model.Schedules);
model.Orders.belongsTo(model.Schedules);
model.Schedules.belongsTo(model.Cinemas);
model.Schedules.belongsTo(model.Movies);

module.exports = model;