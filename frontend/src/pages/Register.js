import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { register as registerApi } from '../services/api';
import { useAuth } from '../context/AuthContext';
import '../styles/Register.css';

function Register() {
    const navigate = useNavigate();
    const { login } = useAuth();

    const [formData, setFormData] = useState({ email: '', password: '', fullName: '', phone: '', address: '' });
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError(null);
        setLoading(true);
        try {
            const response = await registerApi(formData);
            const { token, email, fullName, role } = response.data;
            login({ email, fullName, role }, token);
            alert('✅ Registro exitoso');
            navigate('/');
        } catch (err) {
            setError(err.response?.data?.error || 'Error en el registro');
            setLoading(false);
        }
    };

    return (
        <div className="register">
            <div className="register__card">
                <h1 className="register__title">Crear Cuenta</h1>

                {error && <div className="register__error">{error}</div>}

                <form onSubmit={handleSubmit} className="register__form">
                    <div className="register__group">
                        <label className="register__label">Nombre completo</label>
                        <input type="text" name="fullName" value={formData.fullName} onChange={handleChange} required className="register__input" placeholder="Tu nombre completo" />
                    </div>

                    <div className="register__group">
                        <label className="register__label">Email</label>
                        <input type="email" name="email" value={formData.email} onChange={handleChange} required className="register__input" placeholder="tu@email.com" />
                    </div>

                    <div className="register__group">
                        <label className="register__label">Contraseña</label>
                        <input type="password" name="password" value={formData.password} onChange={handleChange} required minLength="6" className="register__input" placeholder="Mínimo 6 caracteres" />
                    </div>

                    <div className="register__group">
                        <label className="register__label">Teléfono</label>
                        <input type="tel" name="phone" value={formData.phone} onChange={handleChange} className="register__input" placeholder="666 555 444" />
                    </div>

                    <div className="register__group">
                        <label className="register__label">Dirección</label>
                        <textarea name="address" value={formData.address} onChange={handleChange} className="register__textarea" placeholder="Calle, número, ciudad, código postal" />
                    </div>

                    <button type="submit" disabled={loading} className="register__submit-btn">
                        {loading ? 'Creando cuenta...' : 'Crear Cuenta'}
                    </button>
                </form>

                <div className="register__footer">
                    <p>¿Ya tienes cuenta? <Link to="/login">Inicia sesión</Link></p>
                </div>
            </div>
        </div>
    );
}

export default Register;