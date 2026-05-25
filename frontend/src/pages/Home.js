import React, { useState, useEffect } from 'react';
import { getProducts, getCategories } from '../services/api';
import ProductCard from '../components/ProductCard';
import '../styles/Home.css';

function Home() {
    const [products, setProducts] = useState([]);
    const [categories, setCategories] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [selectedCategory, setSelectedCategory] = useState(null);
    const [sortBy, setSortBy] = useState('default');
    const [currentPage, setCurrentPage] = useState(1);
    const productsPerPage = 12;

    useEffect(() => {
        loadData();
    }, []);

    const loadData = async () => {
        try {
            setLoading(true);
            const [productsRes, categoriesRes] = await Promise.all([
                getProducts(),
                getCategories()
            ]);
            setProducts(productsRes.data);
            setCategories(categoriesRes.data);
            setLoading(false);
        } catch (err) {
            setError('Error cargando productos');
            setLoading(false);
            console.error(err);
        }
    };

    const filterByCategory = (categoryId) => {
        setSelectedCategory(categoryId);
        setCurrentPage(1);
    };

    const handleSort = (sortType) => {
        setSortBy(sortType);
        setCurrentPage(1);
    };

    // Filtrar por categoría
    let filteredProducts = selectedCategory
        ? products.filter(p => p.categoryId === selectedCategory)
        : products;

    // Ordenar
    if (sortBy === 'price-asc') {
        filteredProducts = [...filteredProducts].sort((a, b) => a.price - b.price);
    } else if (sortBy === 'price-desc') {
        filteredProducts = [...filteredProducts].sort((a, b) => b.price - a.price);
    }

    // Paginación
    const indexOfLastProduct = currentPage * productsPerPage;
    const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
    const currentProducts = filteredProducts.slice(indexOfFirstProduct, indexOfLastProduct);
    const totalPages = Math.ceil(filteredProducts.length / productsPerPage);

    if (loading) return <div className="home"><div className="home__loading">Cargando productos...</div></div>;
    if (error)   return <div className="home"><div className="home__error">{error}</div></div>;

    return (
        <div className="home">
            <div className="home__header">
                <h1 className="home__title">Productos</h1>
                <p className="home__subtitle">Descubre nuestra colección de streetwear y sneakers</p>
            </div>

            {/* Controles: filtros y ordenamiento */}
            <div className="home__controls">
                <div className="home__filters">
                    <button
                        onClick={() => filterByCategory(null)}
                        className={`filter-btn${selectedCategory === null ? ' filter-btn--active' : ''}`}
                    >
                        Todos ({products.length})
                    </button>
                    {categories.map(cat => {
                        const count = products.filter(p => p.categoryId === cat.id).length;
                        return (
                            <button
                                key={cat.id}
                                onClick={() => filterByCategory(cat.id)}
                                className={`filter-btn${selectedCategory === cat.id ? ' filter-btn--active' : ''}`}
                            >
                                {cat.name} ({count})
                            </button>
                        );
                    })}
                </div>

                <div className="home__sort">
                    <select 
                        value={sortBy} 
                        onChange={(e) => handleSort(e.target.value)}
                        className="home__sort-select"
                    >
                        <option value="default">Ordenar por</option>
                        <option value="price-asc">Precio: Menor a Mayor</option>
                        <option value="price-desc">Precio: Mayor a Menor</option>
                    </select>
                </div>
            </div>

            {/* Grid de productos */}
            <div className="home__grid">
                {currentProducts.map(product => (
                    <ProductCard key={product.id} product={product} />
                ))}
            </div>

            {filteredProducts.length === 0 && (
                <div className="home__empty">No hay productos en esta categoría</div>
            )}

            {/* Paginación */}
            {totalPages > 1 && (
                <div className="home__pagination">
                    <button
                        onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                        disabled={currentPage === 1}
                        className="home__pagination-btn"
                    >
                        Anterior
                    </button>
                    
                    <div className="home__pagination-info">
                        Página {currentPage} de {totalPages}
                    </div>
                    
                    <button
                        onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
                        disabled={currentPage === totalPages}
                        className="home__pagination-btn"
                    >
                        Siguiente
                    </button>
                </div>
            )}
        </div>
    );
}

export default Home;