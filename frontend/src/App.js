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
import Admin from './pages/Admin';
import './styles/global.css';
import './styles/App.css';

function App() {
    return (
        <Router>
            <div className="app-wrapper">
                <Navbar />

                <main className="app-main">
                    <Routes>
                        <Route path="/"            element={<Home />} />
                        <Route path="/product/:id" element={<ProductDetail />} />
                        <Route path="/cart"        element={<Cart />} />
                        <Route path="/login"       element={<Login />} />
                        <Route path="/register"    element={<Register />} />
                        <Route path="/profile"     element={<Profile />} />
                        <Route path="/favorites"   element={<Favorites />} />
                        <Route path="/checkout"    element={<Checkout />} />
                        <Route path="/admin" element={
                            <AdminRoute>
                                <Admin />
                            </AdminRoute>
                        } />
                    </Routes>
                </main>

                <Footer />
            </div>
        </Router>
    );
}

export default App;