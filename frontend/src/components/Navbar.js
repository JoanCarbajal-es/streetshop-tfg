import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { getCart } from '../services/api';
import { Icon } from '@iconify/react';
import SearchBar from './SearchBar';
import '../styles/Navbar.css';

function Navbar() {
    const { user, isAuthenticated, logout } = useAuth();
    const navigate = useNavigate();
    const [cartCount, setCartCount] = useState(0);

    useEffect(() => {
        if (isAuthenticated()) {
            loadCartCount();
        }
    }, [isAuthenticated]);

    const loadCartCount = async () => {
        try {
            const response = await getCart();
            const totalItems = response.data.reduce((sum, item) => sum + item.quantity, 0);
            setCartCount(totalItems);
        } catch (err) {
            console.error('Error cargando carrito:', err);
        }
    };

    const handleLogout = () => {
        logout(); 
        setCartCount(0);
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        sessionStorage.clear();
        window.location.href = '/login';
    };

    return (
        <nav className="navbar">
            <div className="navbar__container">
                <Link to="/" className="navbar__logo">
                    <span>StreetShop</span>
                </Link>

                <SearchBar />

                <div className="navbar__links">
                    <Link to="/" className="navbar__link">Inicio</Link>
                    
                    <Link to="/favorites" className="navbar__link">
                        <Icon icon="solar:heart-linear" className="nav-icon" />
                    </Link>
                    
                    <Link to="/cart" className="navbar__link navbar__link--cart">
                        <Icon icon="solar:cart-3-outline" className="nav-icon" />
                        {cartCount > 0 && (
                            <span className="navbar__badge">{cartCount}</span>
                        )}
                    </Link>

                    {isAuthenticated() ? (
                        <>
                            {user?.role === 'ADMIN' && (
                                <Link to="/admin" className="navbar__link navbar__link--admin">
                                    <Icon 
                                        icon="pajamas:admin" 
                                        className="nav-icon nav-icon--admin" 
                                    />
                                </Link>
                            )}
                            <Link to="/profile" className="navbar__link">
                                <Icon icon="solar:user-circle-outline" className="nav-icon" /> 
                                {user?.fullName || 'Mi Perfil'}
                            </Link>
                            <button onClick={handleLogout} className="navbar__logout">
                                <Icon icon="solar:logout-2-outline" className="nav-icon" />
                            </button>
                        </>
                    ) : (
                        <Link to="/login" className="navbar__link">
                            <Icon icon="solar:lock-password-outline" className="nav-icon" /> Login
                        </Link>
                    )}
                </div>
            </div>
        </nav>
    );
}

export default Navbar;