import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8080';

const api = axios.create({
    baseURL: API_URL,
    headers: {
        'Content-Type': 'application/json',
    },
});

api.interceptors.request.use(
    (config) => {
        const token = localStorage.getItem('token');
        if (token) {
            config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
    },
    (error) => Promise.reject(error)
);

api.interceptors.response.use(
    (response) => response,
    (error) => {
        if (error.response?.status === 401) {
            localStorage.removeItem('token');
            localStorage.removeItem('user');
            window.location.href = '/login';
        }
        return Promise.reject(error);
    }
);

// ========================================
// PRODUCTOS
// ========================================
export const getProducts = () => api.get('/api/products');
export const getProductById = (id) => api.get(`/api/products/${id}`);
export const searchProducts = (name) => api.get(`/api/products/search?name=${name}`);
export const getProductsByBrand = (brand) => api.get(`/api/products/brand/${brand}`);
export const getProductsByCategory = (categoryId) => api.get(`/api/products/category/${categoryId}`);
export const getProductSizes = (productId) => api.get(`/api/products/${productId}/sizes`);

// ========================================
// CATEGORÍAS
// ========================================
export const getCategories = () => api.get('/api/categories');

// ========================================
// AUTENTICACIÓN
// ========================================
export const login = (credentials) => api.post('/api/auth/login', credentials);
export const register = (userData) => api.post('/api/auth/register', userData);

// ========================================
// CARRITO
// ========================================
export const getCart = () => api.get('/api/cart');
export const addToCart = (item) => api.post('/api/cart/add', item);
export const updateCartItem = (itemId, quantity) => api.put(`/api/cart/${itemId}?quantity=${quantity}`);
export const removeFromCart = (itemId) => api.delete(`/api/cart/${itemId}`);
export const clearCart = () => api.delete('/api/cart/clear');

// ========================================
// FAVORITOS
// ========================================
export const getFavorites = () => api.get('/api/favorites');
export const addToFavorites = (productId) => api.post(`/api/favorites/${productId}`);
export const removeFromFavorites = (productId) => api.delete(`/api/favorites/${productId}`);
export const checkFavorite = (productId) => api.get(`/api/favorites/check/${productId}`);

// ========================================
// PEDIDOS
// ========================================
export const getOrders = () => api.get('/api/orders');
export const getOrderById = (orderId) => api.get(`/api/orders/${orderId}`);
export const createOrder = (orderData) => api.post('/api/orders', orderData);
export const downloadInvoice = (orderId) => api.get(`/api/orders/${orderId}/invoice`, { responseType: 'blob' });

// ========================================
// PAGOS
// ========================================
export const createPaymentIntent = (amount) => api.post('/api/payments/create-intent', { amount });

export default api;