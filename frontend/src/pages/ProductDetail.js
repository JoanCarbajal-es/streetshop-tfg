import React, { useState, useEffect } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { getProductById, getProductSizes, addToCart, addToFavorites, removeFromFavorites, checkFavorite} from '../services/api';
import { useCart } from '../context/CartContext';
import '../styles/ProductDetail.css';
import toast from 'react-hot-toast';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8080';

function ProductDetail() {
    const { id } = useParams();
    const navigate = useNavigate();

    const [product, setProduct]           = useState(null);
    const [sizes, setSizes]               = useState([]);
    const [images, setImages]             = useState([]);
    const [activeImage, setActiveImage]   = useState(null);
    const [selectedSize, setSelectedSize] = useState(null);
    const [quantity, setQuantity]         = useState(1);
    const [loading, setLoading]           = useState(true);
    const [error, setError]               = useState(null);
    const [isFavorite, setIsFavorite]     = useState(false);
    const [addingToCart, setAddingToCart] = useState(false);
    const [related, setRelated]           = useState([]);

    useEffect(() => {
        window.scrollTo({ top: 0, behavior: 'instant' });
    }, [id]);

    useEffect(() => {
        loadProduct();
        loadSizes();
        checkIfFavorite();
        loadImages();
    }, [id]);

    const loadProduct = async () => {
        try {
            const response = await getProductById(id);
            const data = response.data;
            setProduct(data);
            setActiveImage(data.imageUrl);
            setLoading(false);
            loadRelated(data.categoryId, data.id);
        } catch (err) {
            setError('Error cargando el producto');
            setLoading(false);
        }
    };

    const loadImages = async () => {
        try {
            const res = await fetch(`${API_URL}/api/products/${id}/images`);
            const data = await res.json();
            setImages(data);
            if (data.length > 0) setActiveImage(data[0].imageUrl);
        } catch (err) {
            console.error('Error cargando imágenes:', err);
        }
    };

    const loadSizes = async () => {
        try {
            const response = await getProductSizes(id);
            setSizes(response.data);
        } catch (err) {
            console.error('Error cargando tallas:', err);
        }
    };

    const loadRelated = async (categoryId, currentId) => {
        try {
            const res = await fetch(`${API_URL}/api/products/category/${categoryId}`);
            const data = await res.json();

            const filtered = data
                .filter(p => p.id !== currentId)
                .slice(0, 4);
            setRelated(filtered);
        } catch (err) {
            console.error('Error cargando productos relacionados:', err);
        }
    };
    const checkIfFavorite = async () => {
        try {
            const response = await checkFavorite(id);
            setIsFavorite(response.data.isFavorite);
        } catch (err) {
            console.error('Error verificando favorito:', err);
        }
    };

    const { refreshCart } = useCart();

    const handleAddToCart = async () => {
        if (!selectedSize) { toast.error('Por favor selecciona una talla'); return; }
        try {
            setAddingToCart(true);
            await addToCart({ productId: parseInt(id), quantity, size: selectedSize });
            refreshCart();
            toast.success('Producto añadido al carrito');
        } catch (err) {
            toast.error('Error añadiendo al carrito');
        } finally {
            setAddingToCart(false);
        }
    };

    const toggleFavorite = async () => {
        try {
            if (isFavorite) { await removeFromFavorites(id); setIsFavorite(false); }
            else            { await addToFavorites(id);      setIsFavorite(true);  }
        } catch (err) {
            console.error('Error con favoritos:', err);
        }
    };

    if (loading) return <div className="product-detail"><div className="product-detail__loading">Cargando producto...</div></div>;
    if (error || !product) return <div className="product-detail"><div className="product-detail__error">{error || 'Producto no encontrado'}</div></div>;

    const availableSizes = sizes.filter(s => s.stock > 0);

    return (
        <div className="product-detail">
            <button onClick={() => navigate(-1)} className="product-detail__back-btn">← Volver</button>

            <div className="product-detail__content">

                <div className="product-detail__gallery">
                    <div className="product-detail__main-image-wrap">
                        <img
                            src={activeImage || product.imageUrl}
                            alt={product.name}
                            className="product-detail__main-image"
                        />
                    </div>

                    {images.length > 1 && (
                        <div className="product-detail__thumbnails">
                            {images.map(img => (
                                <button
                                    key={img.id}
                                    onClick={() => setActiveImage(img.imageUrl)}
                                    className={`product-detail__thumb-btn${activeImage === img.imageUrl ? ' product-detail__thumb-btn--active' : ''}`}
                                >
                                    <img src={img.imageUrl} alt="" className="product-detail__thumb-img" />
                                </button>
                            ))}
                        </div>
                    )}
                </div>

                <div className="product-detail__info">
                    <p className="product-detail__brand">{product.brand}</p>
                    <h1 className="product-detail__name">{product.name}</h1>
                    <p className="product-detail__price">{product.price} €</p>
                    <p className="product-detail__description">{product.description}</p>

                    <div className="product-detail__section">
                        <h3 className="product-detail__section-title">Selecciona tu talla</h3>
                        <div className="product-detail__size-grid">
                            {availableSizes.length > 0 ? (
                                availableSizes.map(size => (
                                    <button
                                        key={size.id}
                                        onClick={() => setSelectedSize(size.size)}
                                        className={`product-detail__size-btn${selectedSize === size.size ? ' product-detail__size-btn--active' : ''}`}
                                    >
                                        {size.size}
                                        <span className="product-detail__size-stock">({size.stock})</span>
                                    </button>
                                ))
                            ) : (
                                <p className="product-detail__no-stock">Sin stock disponible</p>
                            )}
                        </div>
                    </div>

                    <div className="product-detail__section">
                        <h3 className="product-detail__section-title">Cantidad</h3>
                        <div className="product-detail__qty-controls">
                            <button className="product-detail__qty-btn" onClick={() => setQuantity(Math.max(1, quantity - 1))}>-</button>
                            <span className="product-detail__qty-value">{quantity}</span>
                            <button className="product-detail__qty-btn" onClick={() => setQuantity(quantity + 1)}>+</button>
                        </div>
                    </div>

                    <div className="product-detail__actions">
                        <button onClick={handleAddToCart} disabled={addingToCart || availableSizes.length === 0} className="product-detail__add-btn">
                            {addingToCart ? 'Añadiendo...' : 'Añadir al carrito'}
                        </button>
                        <button onClick={toggleFavorite} className="product-detail__fav-btn">
                            {isFavorite ? 'En favoritos' : 'Añadir a favoritos'}
                        </button>
                    </div>
                </div>
            </div>

            {related.length > 0 && (
                <section className="product-detail__related">
                    <div className="product-detail__related-header">
                        <h2 className="product-detail__related-title">También te puede interesar</h2>
                        <Link to={`/?categoryId=${product.categoryId}`} className="product-detail__related-link">
                            Ver todos →
                        </Link>
                    </div>

                    <div className="product-detail__related-grid">
                        {related.map(p => (
                            <Link to={`/product/${p.id}`} key={p.id} className="related-card">
                                <div className="related-card__image">
                                    <img src={p.imageUrl} alt={p.name} />
                                </div>
                                <div className="related-card__info">
                                    <p className="related-card__brand">{p.brand}</p>
                                    <p className="related-card__name">{p.name}</p>
                                    <p className="related-card__price">{p.price} €</p>
                                </div>
                            </Link>
                        ))}
                    </div>
                </section>
            )}
        </div>
    );
}

export default ProductDetail;