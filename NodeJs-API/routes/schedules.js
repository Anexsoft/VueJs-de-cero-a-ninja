let route = '/schedules';

module.exports = (app, context) => {
    app.post(`${route}`, (req, res) => {
        context.Schedules.create(req.body).then(() => {
            res.status(200).send();
        });
    });
};