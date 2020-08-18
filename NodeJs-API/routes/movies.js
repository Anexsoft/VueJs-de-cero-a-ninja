let route = '/movies',
    config = require('./../_config');

module.exports = (app, context) => {
    app.get(`${route}`, (req, res) => {
        context.Movies.findAll()
            .then(result => {
                if (result !== null) {
                    result.forEach(e => {
                        e.image = `http://localhost:${config.port}${e.image}`;
                    });
                }

                res.status(200).send(result);
            })
            .catch(err => {
                console.log(err)
            });
    });

    app.get(`${route}/:id`, (req, res) => {
        context.Movies.findOne({
                where: {
                    id: req.params.id
                }
            })
            .then(result => {
                if (result !== null) {
                    result.image = `http://localhost:${config.port}${result.image}`;
                }

                res.status(200).send(result);
            })
            .catch(err => {
                console.log(err)
            });
    });
};