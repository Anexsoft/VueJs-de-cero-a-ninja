let route = '/cinemas';

module.exports = (app, context) => {
    app.get(`${route}`, (req, res) => {
        context.Cinemas.findAll(
            {
                include: [context.Schedules]

            })
            .then(result => {
                res.status(200).send(result);
            })
            .catch(err => {
                console.log(err)
            });
    });

    app.get(`${route}/:id`, (req, res) => {
        context.Cinemas.findOne(
            {
                where: {
                    id: req.params.id
                },
                include: [
                    {
                        model: context.Schedules,
                        required: false,
                        include: [
                            {
                                model: context.Movies,
                                required: false
                            }
                        ]
                    }
                ]
            })
            .then(result => {
                res.status(200).send(result);
            })
            .catch(err => {
                console.log(err)
            });
    });

    app.put(`${route}/:id`, (req, res) => {
        console.log(req.body)
        context.Cinemas.update(req.body, { where: { id: req.params.id } }).then(() => {
            res.status(200).send();
        });
    });

    app.post(`${route}`, (req, res) => {
        context.Cinemas.create(req.body).then(() => {
            res.status(200).send();
        });
    });
};