export default (axios, baseUrl) => {
    return {
        getAll() {
            return axios.get(`${baseUrl}cinemas`);
        }
    }
}