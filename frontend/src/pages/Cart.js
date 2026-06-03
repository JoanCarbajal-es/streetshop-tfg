import React, { useState, useEffect } from 'react';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import { getCart, updateCartItem, removeFromCart, clearCart } from '../services/api';
import { useCart } from '../context/CartContext';
import '../styles/Cart.css';

function Cart() {
    const navigate = useNavigate();
    const { isAuthenticated } = useAuth();

    const handleCheckout = () => {
        if (!isAuthenticated()) {
            navigate('/login', { state: { from: '/cart' } });
        } else {
            navigate('/checkout');
        }
    };

    const [cartItems, setCartItems] = useState([]);
    const { refreshCart } = useCart();
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => { loadCart(); }, []);

    const loadCart = async () => {
        try {
            setLoading(true);
            const response = await getCart();
            setCartItems(response.data);
            setLoading(false);
        } catch (err) {
            setError('Error cargando el carrito, debes de iniciar sesión');
            setLoading(false);
            console.error(err);
        }
    };

    const handleUpdateQuantity = async (itemId, newQuantity) => {
        if (newQuantity < 1) return;
        try {
            await updateCartItem(itemId, newQuantity);
            loadCart();
            refreshCart();
        } catch (err) {
            alert('Error actualizando cantidad');
            console.error(err);
        }
    };

    const handleRemoveItem = async (itemId) => {
        if (!window.confirm('¿Eliminar este producto del carrito?')) return;
        try {
            await removeFromCart(itemId);
            loadCart();
            refreshCart();
        } catch (err) {
            alert('Error eliminando producto');
            console.error(err);
        }
    };

    const handleClearCart = async () => {
        if (!window.confirm('¿Vaciar todo el carrito?')) return;
        try {
            await clearCart();
            loadCart();
            refreshCart();
        } catch (err) {
            alert('Error vaciando el carrito');
            console.error(err);
        }
    };

    const calculateTotal = () =>
        cartItems.reduce((total, item) => total + parseFloat(item.subtotal), 0).toFixed(2);

    if (loading) return <div className="cart"><div className="cart__loading">Cargando carrito...</div></div>;
    if (error)   return <div className="cart"><div className="cart__error">{error}</div></div>;

    if (cartItems.length === 0) {
        return (
            <div className="cart">
                <div className="cart__empty">
                    <h2>Tu carrito está vacío</h2>
                    <p>Añade productos para empezar tu compra</p>
                    <button onClick={() => navigate('/')} className="cart__empty-btn">Ver productos</button>
                </div>
            </div>
        );
    }

    return (
        <div className="cart">
            <div className="cart__header">
                <h1 className="cart__title">Mi Carrito</h1>
                <button onClick={handleClearCart} className="cart__clear-btn">Vaciar carrito</button>
            </div>

            <div className="cart__content">
                <div className="cart__items">
                    {cartItems.map(item => (
                        <div key={item.id} className="cart-item">
                            <img src={item.productImage} alt={item.productName} className="cart-item__image" />

                            <div className="cart-item__info">
                                <p className="cart-item__brand">{item.brand}</p>
                                <h3 className="cart-item__name">{item.productName}</h3>
                                <p className="cart-item__size">Talla: {item.size}</p>
                                <p className="cart-item__price">{item.price} €</p>
                            </div>

                            <div className="cart-item__actions">
                                <div className="cart-item__qty">
                                    <button className="cart-item__qty-btn" onClick={() => handleUpdateQuantity(item.id, item.quantity - 1)}>-</button>
                                    <span className="cart-item__qty-value">{item.quantity}</span>
                                    <button className="cart-item__qty-btn" onClick={() => handleUpdateQuantity(item.id, item.quantity + 1)}>+</button>
                                </div>
                                <p className="cart-item__subtotal">{item.subtotal} €</p>
                                <button className="cart-item__remove-btn" onClick={() => handleRemoveItem(item.id)}>Eliminar</button>
                            </div>
                        </div>
                    ))}
                </div>

                <div className="cart__summary">
                    <h2 className="cart__summary-title">Resumen</h2>
                    <div className="cart__summary-row">
                        <span>Subtotal ({cartItems.length} productos)</span>
                        <span>{calculateTotal()} €</span>
                    </div>
                    <div className="cart__summary-row">
                        <span>Envío</span>
                        <span>Gratis</span>
                    </div>
                    <div className="cart__summary-divider" />
                    <div className="cart__summary-total">
                        <span>Total</span>
                        <span>{calculateTotal()} €</span>
                    </div>
                    <button onClick={handleCheckout} className="cart__checkout-btn">Proceder al pago</button>
                    <button onClick={() => navigate('/')} className="cart__continue-btn">Seguir comprando</button>
                </div>
            </div>
        </div>
    );
}

export default Cart;