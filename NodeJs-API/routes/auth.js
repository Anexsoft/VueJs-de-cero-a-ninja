let route = '/auth',
    config = require('./../_config');

module.exports = (app, context) => {
    app.post(`${route}/login`, (req, res) => {
        context.Users.findOne(
            {
                attributes: ['id', 'name', 'email'],
                where: {
                    email: req.body.email,
                    password: req.body.password
                }
            })
            .then(result => {
                let isSuccess = result != null;

                let response = {
                    isSuccess,
                    message: isSuccess ? 'Acceso aprobado' : 'Acceso denegado',
                    access_token: isSuccess ? config.access_token : null,
                    result
                };

                res.status(200).send(response);
            })
            .catch(err => {
                console.log(err)
            });
    });
};