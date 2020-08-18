export default (axios, baseUrl) => {
    return {
        get(id) {
            return axios.get(`${baseUrl}cinemas/${id}`);
        },
        getAll() {
            return axios.get(`${baseUrl}cinemas`);
        },
        create(params) {
            return axios.post(`${baseUrl}cinemas`, params);
        },
        update(id, params) {
            return axios.put(`${baseUrl}cinemas/${id}`, params);
        }
    }
}