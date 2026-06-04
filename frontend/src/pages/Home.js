import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { getProducts, getCategories } from '../services/api';
import ProductCard from '../components/ProductCard';
import '../styles/Home.css';

function Home() {
    const location = useLocation();
    const [products, setProducts] = useState([]);
    const [categories, setCategories] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [selectedCategory, setSelectedCategory] = useState(null);
    const [sortBy, setSortBy] = useState('default');
    const [currentPage, setCurrentPage] = useState(1);
    const productsPerPage = 12;

    useEffect(() => {
        setError(null);
        loadData();
    }, [location.key]);

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

    const ROPA_SUBCATEGORY_IDS = [4, 5, 6, 7];
    const ROPA_CATEGORY_ID = 2;

    const filterByCategory = (categoryId) => {
        setSelectedCategory(categoryId);
        setCurrentPage(1);
    };

    const handleSort = (sortType) => {
        setSortBy(sortType);
        setCurrentPage(1);
    };

    let filteredProducts = selectedCategory
        ? selectedCategory === ROPA_CATEGORY_ID
            ? products.filter(p => ROPA_SUBCATEGORY_IDS.includes(p.categoryId))
            : products.filter(p => p.categoryId === selectedCategory)
        : products;

    if (sortBy === 'price-asc') {
        filteredProducts = [...filteredProducts].sort((a, b) => a.price - b.price);
    } else if (sortBy === 'price-desc') {
        filteredProducts = [...filteredProducts].sort((a, b) => b.price - a.price);
    }

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

            <div className="home__controls">
                <div className="home__filters">
                    <button
                        onClick={() => filterByCategory(null)}
                        className={`filter-btn${selectedCategory === null ? ' filter-btn--active' : ''}`}
                    >
                        Todos ({products.length})
                    </button>
                    {categories.map(cat => {
                        const count = cat.id === ROPA_CATEGORY_ID
                            ? products.filter(p => ROPA_SUBCATEGORY_IDS.includes(p.categoryId)).length
                            : products.filter(p => p.categoryId === cat.id).length;
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

            <div className="home__grid">
                {currentProducts.map(product => (
                    <ProductCard key={product.id} product={product} />
                ))}
            </div>

            {filteredProducts.length === 0 && (
                <div className="home__empty">No hay productos en esta categoría</div>
            )}

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