let route = '/orders';

module.exports = (app, context) => {
    app.get(`${route}`, (req, res) => {
        context.Orders.findAll(
            {
                include: [
                    {
                        model: context.Schedules,
                        required: true,
                        include: [
                            {
                                model: context.Cinemas,
                                required: true
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

    app.post(`${route}`, (req, res) => {
        let order = req.body;

        context.Schedules.findOne({
            include: [context.Cinemas],
            where: {
                id: order.scheduleId
            }
        })
            .then(result => {
                order.total = result.cinema.price * order.quantity;
                create();

                res.status(200).send();
            })
            .catch(err => {
                console.log(err)
            });

        function create() {
            context.Orders.create(order).then(() => {
                res.status(200).send();
            });
        }
    });
};