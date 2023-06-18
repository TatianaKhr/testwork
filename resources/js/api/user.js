import axios from "axios";

export function list() {
    return axios.get('/api/users');
}

export function get(id) {
    return axios.get(`/api/user/${id}/transactions`)
}
