import React, { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { loadStripe } from '@stripe/stripe-js';
import { createOrder } from '../services/api';
import { useCart } from '../context/CartContext';

const stripePromise = loadStripe(process.env.REACT_APP_STRIPE_PUBLIC_KEY);

function CheckoutReturnInner() {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const { refreshCart } = useCart();
    const [message, setMessage] = useState('Verificando tu pago...');

    useEffect(() => {
        const clientSecret = searchParams.get('payment_intent_client_secret');

        if (!clientSecret) {
            navigate('/cart');
            return;
        }

        stripePromise.then(async (stripe) => {
            if (!stripe) return;

            const { paymentIntent } = await stripe.retrievePaymentIntent(clientSecret);

            if (paymentIntent?.status === 'succeeded') {
                const shippingAddress = sessionStorage.getItem('ss_shipping') || '';
                const phone = sessionStorage.getItem('ss_phone') || '';

                try {
                    const orderResponse = await createOrder({
                        shippingAddress,
                        phone,
                        paymentMethod: 'STRIPE',
                        paymentIntentId: paymentIntent.id,
                    });

                    sessionStorage.removeItem('ss_shipping');
                    sessionStorage.removeItem('ss_phone');

                    refreshCart();
                    navigate('/profile', {
                        state: {
                            successMessage: `¡Pedido #${orderResponse.data.orderNumber} realizado con éxito!`,
                        },
                    });
                } catch (err) {
                    setMessage(
                        'Pago completado con Klarna, pero hubo un error al crear el pedido. ' +
                        'Por favor contacta con soporte indicando tu email.'
                    );
                }
            } else {
                setMessage('El pago no se completó. Por favor vuelve al carrito e inténtalo de nuevo.');
            }
        });
    }, []);

    return (
        <div className="cart__loading" style={{ textAlign: 'center', padding: '60px 20px' }}>
            <p>{message}</p>
            {message !== 'Verificando tu pago...' && (
                <button
                    onClick={() => navigate('/cart')}
                    style={{
                        marginTop: '20px',
                        padding: '10px 24px',
                        background: '#0a0a0a',
                        color: '#fff',
                        border: 'none',
                        borderRadius: '6px',
                        cursor: 'pointer',
                        fontSize: '14px',
                    }}
                >
                    Volver al carrito
                </button>
            )}
        </div>
    );
}

export default CheckoutReturnInner;