import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import AdminRoute from './components/admin/AdminRoute';
import Home from './pages/Home';
import ProductDetail from './pages/ProductDetail';
import Cart from './pages/Cart';
import Login from './pages/Login';
import Register from './pages/Register';
import Profile from './pages/Profile';
import Favorites from './pages/Favorites';
import Checkout from './pages/Checkout';
import CheckoutReturn from './pages/CheckoutReturn';
import Admin from './pages/Admin';
import { CartProvider } from './context/CartContext';
import { Toaster } from 'react-hot-toast';
import './styles/global.css';
import './styles/App.css';

function App() {
    return (
        <Router>
            <CartProvider>
                <div className="app-wrapper">
                    <Navbar />
                    <main className="app-main">
                        <Routes>
                            <Route path="/"                  element={<Home />} />
                            <Route path="/product/:id"       element={<ProductDetail />} />
                            <Route path="/cart"              element={<Cart />} />
                            <Route path="/login"             element={<Login />} />
                            <Route path="/register"          element={<Register />} />
                            <Route path="/profile"           element={<Profile />} />
                            <Route path="/favorites"         element={<Favorites />} />
                            <Route path="/checkout"          element={<Checkout />} />
                            <Route path="/checkout/return"   element={<CheckoutReturn />} />
                            <Route path="/admin" element={
                                <AdminRoute>
                                    <Admin />
                                </AdminRoute>
                            } />
                        </Routes>
                    </main>
                    <Footer />
                </div>
                <Toaster
                    position="top-right"
                    toastOptions={{
                        duration: 3000,
                        style: {
                            background: '#272727',
                            color: '#fff',
                            borderRadius: '8px',
                            fontSize: '14px'
                        },
                        success: { icon: null },
                        error: { icon: null }
                    }}
                />
            </CartProvider>
        </Router>
    );
}

export default App;