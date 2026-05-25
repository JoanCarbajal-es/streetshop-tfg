import React, { useState, useEffect } from 'react';
import axios from 'axios';
import API_URL from '../config';
import '../styles/HealthCheck.css';

function HealthCheck() {
    const [status, setStatus] = useState('Verificando...');
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [backendData, setBackendData] = useState(null);

    useEffect(() => {
        checkBackendHealth();
    }, []);

    const checkBackendHealth = async () => {
        try {
            setLoading(true);
            setError(null);
            const response = await axios.get(`${API_URL}/api/health`);
            setBackendData(response.data);
            setStatus('✅ Conectado');
            setLoading(false);
        } catch (err) {
            setError(err.message);
            setStatus('❌ Error de conexión');
            setLoading(false);
        }
    };

    return (
        <div className="healthcheck">
            <div className="healthcheck__card">
                <h2 className="healthcheck__title">🔌 Estado del Backend</h2>

                <div className="healthcheck__badge">
                    {loading ? '⏳ Verificando...' : status}
                </div>

                {backendData && (
                    <div className="healthcheck__info">
                        <p><strong>Servicio:</strong> {backendData.service}</p>
                        <p><strong>Versión:</strong> {backendData.version}</p>
                        <p><strong>Estado:</strong> {backendData.status}</p>
                        <p><strong>Mensaje:</strong> {backendData.message}</p>
                    </div>
                )}

                {error && (
                    <div className="healthcheck__error">
                        <p><strong>Error:</strong> {error}</p>
                        <p>Asegúrate de que el backend esté corriendo en {API_URL}</p>
                    </div>
                )}

                <button
                    onClick={checkBackendHealth}
                    className="healthcheck__btn"
                    disabled={loading}
                >
                    {loading ? 'Verificando...' : '🔄 Verificar de nuevo'}
                </button>

                <div className="healthcheck__api-info">
                    <p><strong>API URL:</strong> {API_URL}</p>
                </div>
            </div>
        </div>
    );
}

export default HealthCheck;