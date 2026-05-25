import React from 'react';
import { Link } from 'react-router-dom';
import '../styles/ProductCard.css';

function ProductCard({ product, isFeatured }) {
    if (!product) return null; 

    return (
        <Link 
            to={`/product/${product.id}`} 
            className={`product-card ${isFeatured ? 'product-card--featured' : ''}`}
        >
            <div className="product-card__image-wrap">
                <img
                    src={product.imageUrl}
                    alt={product.name}
                    className="product-card__image"
                />
            </div>

            <div className="product-card__info">
                <p className="product-card__brand">{product.brand}</p>
                <h3 className="product-card__name">{product.name}</h3>
                <p className="product-card__price">{product.price} €</p>
            </div>
        </Link>
    );
}

export default ProductCard;