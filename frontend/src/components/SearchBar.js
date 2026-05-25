import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { searchProducts } from '../services/api';
import { Icon } from '@iconify/react';
import '../styles/SearchBar.css';

function SearchBar() {
    const navigate = useNavigate();
    const [query, setQuery] = useState('');
    const [results, setResults] = useState([]);
    const [showResults, setShowResults] = useState(false);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        const searchDelay = setTimeout(() => {
            if (query.trim().length >= 2) {
                handleSearch(query);
            } else {
                setResults([]);
                setShowResults(false);
            }
        }, 300);

        return () => clearTimeout(searchDelay);
    }, [query]);

    const handleSearch = async (searchQuery) => {
        try {
            setLoading(true);
            const response = await searchProducts(searchQuery);
            setResults(response.data.slice(0, 5));
            setShowResults(true);
            setLoading(false);
        } catch (err) {
            console.error('Error buscando:', err);
            setLoading(false);
        }
    };

    const handleProductClick = (productId) => {
        setQuery('');
        setShowResults(false);
        navigate(`/product/${productId}`);
    };

    const handleBlur = () => {
        setTimeout(() => setShowResults(false), 200);
    };

    return (
        <div className="search-bar">
            <div className="search-bar__box">
                <input
                    type="text"
                    placeholder="Busca tus productos..."
                    value={query}
                    onChange={(e) => setQuery(e.target.value)}
                    onFocus={() => query.length >= 2 && setShowResults(true)}
                    onBlur={handleBlur}
                    className="search-bar__input"
                />
                <span className="search-bar__icon"><Icon icon="ph:magnifying-glass-bold" /></span>
            </div>

            {showResults && (
                <div className="search-bar__results">
                    {loading && (
                        <div className="search-bar__loading">
                            Buscando...
                        </div>
                    )}

                    {!loading && results.length === 0 && (
                        <div className="search-bar__no-results">
                            No se encontraron productos
                        </div>
                    )}

                    {!loading && results.length > 0 && (
                        <>
                            {results.map(product => (
                                <div
                                    key={product.id}
                                    onClick={() => handleProductClick(product.id)}
                                    className="search-bar__result-item"
                                >
                                    <img 
                                        src={product.imageUrl} 
                                        alt={product.name}
                                        className="search-bar__result-image"
                                    />
                                    <div className="search-bar__result-info">
                                        <p className="search-bar__result-brand">{product.brand}</p>
                                        <p className="search-bar__result-name">{product.name}</p>
                                        <p className="search-bar__result-price">{product.price} €</p>
                                    </div>
                                </div>
                            ))}
                            
                            {results.length === 5 && (
                                <div className="search-bar__view-all">
                                    Escribe más para hacer la búsqueda...
                                </div>
                            )}
                        </>
                    )}
                </div>
            )}
        </div>
    );
}

export default SearchBar;