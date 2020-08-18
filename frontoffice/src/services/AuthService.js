export default (axios, baseUrl) => {
    return {
        login(params) {
            return axios.post(`${baseUrl}auth/login`, params);
        },
        prepare(token) {
            axios.defaults.headers.common.authorization = token;
        }
    }
}