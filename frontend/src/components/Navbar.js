import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { Icon } from '@iconify/react';
import SearchBar from './SearchBar';
import logoIcon from '../assets/logo-icon.png';
import { useCart } from '../context/CartContext';
import '../styles/Navbar.css';

function Navbar() {
    const { user, isAuthenticated, logout } = useAuth();
    const { cartCount } = useCart();
    const navigate = useNavigate();
    const [menuOpen, setMenuOpen] = useState(false);

    useEffect(() => {
        if (menuOpen) setMenuOpen(false);
    }, [navigate]);

    useEffect(() => {
        document.body.classList.toggle('menu-open', menuOpen);
        return () => document.body.classList.remove('menu-open');
    }, [menuOpen]);


    const handleLogout = () => {
        logout();
        setMenuOpen(false);
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        sessionStorage.clear();
        window.location.href = '/login';
    };

    const closeMenu = () => setMenuOpen(false);

    return (
        <nav className="navbar">
            <div className="navbar__container">
                <Link to="/" className="navbar__logo" onClick={closeMenu}>
                    <img src={logoIcon} alt="StreetShop" className="navbar__logo-img" />
                </Link>

                <SearchBar />

                <button
                    className={`navbar__hamburger${menuOpen ? ' navbar__hamburger--open' : ''}`}
                    onClick={() => setMenuOpen(!menuOpen)}
                    aria-label="Abrir menú"
                    aria-expanded={menuOpen}
                >
                    <span />
                    <span />
                    <span />
                </button>

                {menuOpen && (
                    <div className="navbar__overlay" onClick={closeMenu} />
                )}

                <div className={`navbar__links${menuOpen ? ' navbar__links--open' : ''}`}>
                    <Link to="/" className="navbar__link" onClick={closeMenu}>Inicio</Link>

                    <Link to="/favorites" className="navbar__link" onClick={closeMenu}>
                        <Icon icon="solar:heart-linear" className="nav-icon" />
                        <span className="navbar__link-label">Favoritos</span>
                    </Link>

                    <Link to="/cart" className="navbar__link navbar__link--cart" onClick={closeMenu}>
                        <Icon icon="solar:cart-3-outline" className="nav-icon" />
                        <span className="navbar__link-label">Carrito</span>
                        {cartCount > 0 && (
                            <span className="navbar__badge">{cartCount}</span>
                        )}
                    </Link>

                    {isAuthenticated() ? (
                        <>
                            {user?.role === 'ADMIN' && (
                                <Link to="/admin" className="navbar__link navbar__link--admin" onClick={closeMenu}>
                                    <Icon icon="pajamas:admin" className="nav-icon nav-icon--admin" />
                                    <span className="navbar__link-label">Admin</span>
                                </Link>
                            )}
                            <Link to="/profile" className="navbar__link" onClick={closeMenu}>
                                <Icon icon="solar:user-circle-outline" className="nav-icon" />
                                {user?.fullName || 'Mi Perfil'}
                            </Link>
                            <button onClick={handleLogout} className="navbar__logout">
                                <Icon icon="solar:logout-2-outline" className="nav-icon" />
                                <span className="navbar__link-label">Salir</span>
                            </button>
                        </>
                    ) : (
                        <Link to="/login" className="navbar__link" onClick={closeMenu}>
                            <Icon icon="solar:lock-password-outline" className="nav-icon" /> Login
                        </Link>
                    )}
                </div>
            </div>
        </nav>
    );
}

export default Navbar;