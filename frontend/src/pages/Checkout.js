import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { loadStripe } from '@stripe/stripe-js';
import {
    Elements,
    PaymentElement,
    useStripe,
    useElements,
} from '@stripe/react-stripe-js';
import { getCart, createOrder, createPaymentIntent } from '../services/api';
import { useAuth } from '../context/AuthContext';
import { useCart } from '../context/CartContext';
import '../styles/Checkout.css';
import toast from 'react-hot-toast';

const stripePromise = loadStripe(process.env.REACT_APP_STRIPE_PUBLIC_KEY);

function CheckoutForm({ cartItems, formData, handleChange, calculateTotal, onSuccess, userEmail }) {
    const stripe = useStripe();
    const elements = useElements();
    const [processing, setProcessing] = useState(false);
    const [stripeError, setStripeError] = useState(null);

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (!formData.shippingAddress || !formData.phone) {
            setStripeError('Por favor completa todos los campos de envío.');
            return;
        }

        if (!stripe || !elements) return;

        setProcessing(true);
        setStripeError(null);

        const { error, paymentIntent } = await stripe.confirmPayment({
            elements,
            redirect: 'if_required',
        });

        if (error) {
            setStripeError(error.message);
            setProcessing(false);
            return;
        }

        if (paymentIntent.status !== 'succeeded') {
            setStripeError('El pago no se pudo completar. Inténtalo de nuevo.');
            setProcessing(false);
            return;
        }

        try {
            const orderResponse = await createOrder({
                shippingAddress: formData.shippingAddress,
                phone: formData.phone,
                paymentMethod: 'STRIPE',
                paymentIntentId: paymentIntent.id,
            });
            onSuccess(orderResponse.data.orderNumber);
        } catch (err) {
            setStripeError('Pago completado, pero hubo un error al crear el pedido: ' + (err.response?.data?.error || err.message));
            setProcessing(false);
        }
    };

    return (
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

            <h2 className="checkout-section-title" style={{ marginTop: '32px' }}>Método de pago</h2>

            {/* PaymentElement muestra automáticamente: tarjeta, Google Pay, Apple Pay y Klarna */}
            <div className="checkout-stripe-element">
                <PaymentElement
                    options={{
                        layout: 'tabs',
                        wallets: {
                            googlePay: 'auto',
                            applePay: 'auto',
                        },
                        defaultValues: {
                            billingDetails: {
                                email: userEmail || '',  // ← precarga el email del usuario logueado
                            },
                        },
                    }}
                />
            </div>

            {stripeError && (
                <div className="checkout-stripe-error">
                    ⚠️ {stripeError}
                </div>
            )}

            <button
                type="submit"
                disabled={processing || !stripe}
                className="checkout-submit-btn"
            >
                {processing ? 'Procesando...' : `Pagar ${calculateTotal()} €`}
            </button>

            <p className="checkout-note">
                Al realizar el pedido, aceptas nuestras condiciones de venta y política de privacidad.
            </p>
        </form>
    );
}

function Checkout() {
    const navigate = useNavigate();
    const { user } = useAuth();
    const { refreshCart } = useCart();

    const [cartItems, setCartItems] = useState([]);
    const [loading, setLoading] = useState(true);
    const [clientSecret, setClientSecret] = useState(null);
    const [formData, setFormData] = useState({
        shippingAddress: '',
        phone: '',
    });

    useEffect(() => {
        loadCartAndCreateIntent();
    }, []);

    const loadCartAndCreateIntent = async () => {
        try {
            const response = await getCart();
            const items = response.data;

            if (items.length === 0) {
                toast.error('Tu carrito está vacío');
                navigate('/cart');
                return;
            }

            setCartItems(items);

            const total = items
                .reduce((sum, item) => sum + parseFloat(item.subtotal), 0)
                .toFixed(2);

            const paymentResponse = await createPaymentIntent(parseFloat(total));
            setClientSecret(paymentResponse.data.clientSecret);
            setLoading(false);
        } catch (err) {
            console.error(err);
            toast.error('Error cargando el carrito');
            navigate('/cart');
        }
    };

    const calculateTotal = () => {
        return cartItems.reduce((total, item) => total + parseFloat(item.subtotal), 0).toFixed(2);
    };

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSuccess = (orderNumber) => {
        refreshCart();
        navigate('/profile', {
            state: { successMessage: `✅ ¡Pedido #${orderNumber} realizado con éxito!` },
        });
    };

    if (loading) {
        return <div className="cart__loading">Cargando pedido...</div>;
    }

    const stripeOptions = {
        clientSecret,
        appearance: {
            theme: 'stripe',
            variables: {
                colorPrimary: '#0a0a0a',
                colorBackground: '#ffffff',
                colorText: '#0a0a0a',
                colorDanger: '#ff3b3b',
                fontFamily: 'DM Sans, sans-serif',
                borderRadius: '6px',
                spacingUnit: '4px',
            },
        },
    };

    return (
        <div className="checkout-container">
            <h1 className="checkout-title">💳 Finalizar Compra</h1>

            <div className="checkout-content">
                <div className="checkout-form-section">
                    <Elements stripe={stripePromise} options={stripeOptions}>
                        <CheckoutForm
                            cartItems={cartItems}
                            formData={formData}
                            handleChange={handleChange}
                            calculateTotal={calculateTotal}
                            onSuccess={handleSuccess}
                            userEmail={user?.email}
                        />
                    </Elements>
                </div>

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