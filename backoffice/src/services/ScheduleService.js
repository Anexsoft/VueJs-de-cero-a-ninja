export default (axios, baseUrl) => {
    return {
        create(params) {
            return axios.post(`${baseUrl}schedules`, params);
        }
    }
}