import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { getFavorites, removeFromFavorites } from '../services/api';
import ProductCard from '../components/ProductCard';
import '../styles/Favorites.css';

function Favorites() {
    const navigate = useNavigate();
    const [favorites, setFavorites] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => { loadFavorites(); }, []);

    const loadFavorites = async () => {
        try {
            setLoading(true);
            const response = await getFavorites();
            setFavorites(response.data);
            setLoading(false);
        } catch (err) {
            setError('Error cargando favoritos, debes de iniciar sesión');
            setLoading(false);
            console.error(err);
        }
    };

    const handleRemoveFavorite = async (productId, e) => {
        e.preventDefault();
        if (!window.confirm('¿Eliminar de favoritos?')) return;
        try {
            await removeFromFavorites(productId);
            loadFavorites();
        } catch (err) {
            alert('Error eliminando favorito');
            console.error(err);
        }
    };

    if (loading) return <div className="favorites__loading">Cargando favoritos...</div>;
    if (error)   return <div className="favorites__error">{error}</div>;

    if (favorites.length === 0) {
        return (
            <div className="favorites__empty">
                <h2>No tienes favoritos</h2>
                <p>Añade productos a favoritos para verlos aquí</p>
                <button onClick={() => navigate('/')} className="favorites__shop-btn">Ver productos</button>
            </div>
        );
    }

    return (
        <div className="favorites">
            <div className="favorites__header">
                <h1 className="favorites__title">Mis Favoritos</h1>
                <p className="favorites__subtitle">{favorites.length} productos guardados</p>
            </div>

            <div className="favorites__grid">
                {favorites.map(product => (
                    <div key={product.id} className="favorites__item">
                        <ProductCard product={product} />
                        <button
                            onClick={(e) => handleRemoveFavorite(product.id, e)}
                            className="favorites__remove-btn"
                        >
                            ✕ Eliminar
                        </button>
                    </div>
                ))}
            </div>
        </div>
    );
}

export default Favorites;