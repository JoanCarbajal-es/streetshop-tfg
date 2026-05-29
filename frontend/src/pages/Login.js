import React, { useState } from 'react';
import { Link, useNavigate, useLocation } from 'react-router-dom';
import { login as loginApi } from '../services/api';
import { useAuth } from '../context/AuthContext';
import logoFull from '../assets/logo-full.png';
import '../styles/Login.css';

function Login() {
    const navigate = useNavigate();
    const { login } = useAuth();
    const location = useLocation();
    const from = location.state?.from || '/';

    const [formData, setFormData] = useState({ email: '', password: '' });
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError(null);
        setLoading(true);
        try {
            const response = await loginApi(formData);
            const { token, email, fullName, role } = response.data;
            login({ email, fullName, role }, token);
            navigate(from);
        } catch (err) {
            setError('Email o contraseña incorrectos');
            setLoading(false);
        }
    };

    return (
        <div className="login">
            <div className="login__card">
                <img src={logoFull} alt="StreetShop" className="login__logo" />
                <p className="login__eyebrow">Bienvenido a StreetShop</p>
                <h1 className="login__title">Iniciar sesión</h1>
                <p className="login__subtitle">Accede a tu cuenta para continuar con tu compra.</p>
                <div className="login__divider" />

                {error && <div className="login__error">{error}</div>}

                <form onSubmit={handleSubmit} className="login__form">
                    <div className="login__group">
                        <label className="login__label">Email</label>
                        <input
                            type="email"
                            name="email"
                            value={formData.email}
                            onChange={handleChange}
                            required
                            className="login__input"
                            placeholder="tu@email.com"
                        />
                    </div>

                    <div className="login__group">
                        <label className="login__label">Contraseña</label>
                        <input
                            type="password"
                            name="password"
                            value={formData.password}
                            onChange={handleChange}
                            required
                            className="login__input"
                            placeholder="••••••••"
                        />
                    </div>

                    <button type="submit" disabled={loading} className="login__submit-btn">
                        {loading ? 'Iniciando sesión...' : 'Iniciar Sesión'}
                    </button>
                </form>

                <div className="login__footer">
                    <p>¿No tienes cuenta? <Link to="/register">Regístrate</Link></p>
                </div>
            </div>
        </div>
    );
}

export default Login;