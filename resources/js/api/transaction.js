import axios from "axios";

export function list() {
    return axios.get('/api/transactions');
}

export function create(request) {
    return axios.post('/api/transactions', request);
}

export function destroy(id) {
    return axios.delete(`/api/transactions/${id}`);
}

export function get(id) {
    return axios.get(`/api/transactions/${id}/edit`);
}

export function update(id, request) {
    return axios.post(`/api/transactions/${id}`, request);
}

