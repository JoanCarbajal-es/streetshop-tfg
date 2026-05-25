import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { getCart, createOrder, createPaymentIntent } from '../services/api';
import '../styles/Checkout.css';

function Checkout() {
    const navigate = useNavigate();
    
    const [cartItems, setCartItems] = useState([]);
    const [loading, setLoading] = useState(true);
    const [processing, setProcessing] = useState(false);
    const [formData, setFormData] = useState({
        shippingAddress: '',
        phone: '',
        paymentMethod: 'STRIPE'
    });

    useEffect(() => {
        loadCart();
    }, []);

    const loadCart = async () => {
        try {
            setLoading(true); // Asegúrate de que empiece en true
            const response = await getCart();
            const items = response.data;
            
            setCartItems(items);
            setLoading(false);
            
            if (items.length === 0) {
                alert('Tu carrito está vacío');
                navigate('/cart');
            }
        } catch (err) {
            console.error(err);
            alert('Error cargando el carrito');
            navigate('/cart');
        }
    };

    const calculateTotal = () => {
        return cartItems.reduce((total, item) => total + parseFloat(item.subtotal), 0).toFixed(2);
    };

    const handleChange = (e) => {
        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        
        if (!formData.shippingAddress || !formData.phone) {
            alert('Por favor completa todos los campos');
            return;
        }

        setProcessing(true);

        try {
            // 1. Crear Payment Intent en Stripe
            const total = parseFloat(calculateTotal());
            const paymentResponse = await createPaymentIntent(total);
            
            // 2. Simulación de pago
            alert('💳 Procesando pago...\n(En producción aquí iría el formulario de Stripe)');

            // 3. Crear el pedido
            const orderResponse = await createOrder({
                shippingAddress: formData.shippingAddress,
                phone: formData.phone,
                paymentMethod: formData.paymentMethod
            });

            alert('✅ ¡Pedido realizado con éxito!\n\nPedido #' + orderResponse.data.orderNumber);
            
            // 4. Redirigir al perfil
            navigate('/profile');

        } catch (err) {
            alert('❌ Error procesando el pedido: ' + (err.response?.data?.error || err.message));
            setProcessing(false);
        }
    };

    if (loading) {
        return <div className="cart__loading">Cargando pedido...</div>;
    }

    return (
        <div className="checkout-container">
            <h1 className="checkout-title">💳 Finalizar Compra</h1>

            <div className="checkout-content">
                {/* Columna Izquierda: Formulario */}
                <div className="checkout-form-section">
                    <form onSubmit={handleSubmit}>
                        <h2 className="checkout-section-title">Datos de envío</h2>

                        <div className="checkout-form-group">
                            <label className="checkout-label">Dirección de envío *</label>
                            <textarea
                                name="shippingAddress"
                                value={formData.shippingAddress}
                                onChange={handleChange}
                                required
                                className="checkout-input"
                                style={{ minHeight: '100px' }}
                                placeholder="Calle, número, piso, ciudad, código postal"
                            />
                        </div>

                        <div className="checkout-form-group">
                            <label className="checkout-label">Teléfono de contacto *</label>
                            <input
                                type="tel"
                                name="phone"
                                value={formData.phone}
                                onChange={handleChange}
                                required
                                className="checkout-input"
                                placeholder="666 777 888"
                            />
                        </div>

                        <h2 className="checkout-section-title">Método de pago</h2>

                        <div className="checkout-payment-methods">
                            <label className="checkout-payment-option">
                                <input
                                    type="radio"
                                    name="paymentMethod"
                                    value="STRIPE"
                                    checked={formData.paymentMethod === 'STRIPE'}
                                    onChange={handleChange}
                                />
                                <span className="checkout-payment-label">
                                    💳 Tarjeta de crédito/débito (Stripe)
                                </span>
                            </label>
                        </div>

                        <button 
                            type="submit" 
                            disabled={processing}
                            className="checkout-submit-btn"
                        >
                            {processing ? 'Procesando...' : `Pagar ${calculateTotal()} €`}
                        </button>

                        <p className="checkout-note">
                            Al realizar el pedido, aceptas nuestras condiciones de venta y política de privacidad.
                        </p>
                    </form>
                </div>

                {/* Columna Derecha: Resumen del pedido */}
                <div className="checkout-summary-section">
                    <h2 className="checkout-section-title">Resumen</h2>

                    <div className="checkout-items-list">
                        {cartItems.map(item => (
                            <div key={item.id} className="checkout-summary-item">
                                <img 
                                    src={item.productImage} 
                                    alt={item.productName}
                                    className="checkout-summary-image"
                                />
                                <div className="checkout-summary-info">
                                    <p className="checkout-summary-name">{item.productName}</p>
                                    <p className="checkout-summary-details">
                                        Talla: {item.size} | Cantidad: {item.quantity}
                                    </p>
                                    <p className="checkout-summary-price">{item.subtotal} €</p>
                                </div>
                            </div>
                        ))}
                    </div>

                    <div className="checkout-divider"></div>

                    <div className="checkout-row">
                        <span>Subtotal</span>
                        <span>{calculateTotal()} €</span>
                    </div>

                    <div className="checkout-row">
                        <span>Envío</span>
                        <span style={{ color: 'var(--color-success, #2e7d32)', fontWeight: '600' }}>Gratis</span>
                    </div>

                    <div className="checkout-divider"></div>

                    <div className="checkout-total">
                        <span>Total</span>
                        <span>{calculateTotal()} €</span>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Checkout;