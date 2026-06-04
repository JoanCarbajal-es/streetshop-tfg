import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import { getOrders, downloadInvoice } from '../services/api';
import '../styles/Profile.css';
import toast from 'react-hot-toast';

function Profile() {
    const navigate = useNavigate();
    const { user, logout } = useAuth();
    const [orders, setOrders] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => { loadOrders(); }, []);

    const loadOrders = async () => {
        try {
            setLoading(true);
            const response = await getOrders();
            setOrders(response.data);
            setLoading(false);
        } catch (err) {
            setError('Error cargando pedidos');
            setLoading(false);
            console.error(err);
        }
    };

    const handleDownloadInvoice = async (orderId) => {
        try {
            const response = await downloadInvoice(orderId);
            const url = window.URL.createObjectURL(new Blob([response.data], { type: 'application/pdf' }));
            const link = document.createElement('a');
            link.href = url;
            link.setAttribute('download', `factura-${orderId}.pdf`);
            document.body.appendChild(link);
            link.click();
            link.remove();
        } catch (err) {
            toast.error('Error descargando factura');
            console.error(err);
        }
    };

    const handleLogout = () => { logout(); navigate('/'); };

    const getStatusBadge = (status) => {
        const map = {
            PENDING:   { cls: 'pending',   text: 'Pendiente' },
            PAID:      { cls: 'paid',      text: 'Pagado'    },
            SHIPPED:   { cls: 'shipped',   text: 'Enviado'   },
            DELIVERED: { cls: 'delivered', text: 'Entregado' },
        };
        const { cls, text } = map[status] || map.PENDING;
        return <span className={`order-badge order-badge--${cls}`}>{text}</span>;
    };

    return (
        <div className="profile">
            <div className="profile__user-card">
                <h1 className="profile__name">{user?.fullName}</h1>
                <p className="profile__email">{user?.email}</p>
                <button onClick={handleLogout} className="profile__logout-btn">Cerrar sesión</button>
            </div>

            <div className="profile__orders">
                <h2 className="profile__section-title">Mis Pedidos</h2>

                {loading && <div className="profile__loading">Cargando pedidos...</div>}
                {error   && <div className="profile__error">{error}</div>}

                {!loading && !error && orders.length === 0 && (
                    <div className="profile__no-orders">
                        <p>No tienes pedidos todavía</p>
                        <button onClick={() => navigate('/')} className="profile__shop-btn">Ir a comprar</button>
                    </div>
                )}

                {!loading && orders.length > 0 && (
                    <div className="profile__orders-list">
                        {orders.map(order => (
                            <div key={order.id} className="order-card">
                                <div className="order-card__header">
                                    <div>
                                        <h3 className="order-card__number">Pedido #{order.orderNumber}</h3>
                                        <p className="order-card__date">
                                            {new Date(order.createdAt).toLocaleDateString('es-ES', { day: 'numeric', month: 'long', year: 'numeric' })}
                                        </p>
                                    </div>
                                    {getStatusBadge(order.status)}
                                </div>

                                <div className="order-card__items">
                                    {order.items.map(item => (
                                        <div key={item.id} className="order-card__item">
                                            <span>{item.productName} (x{item.quantity})</span>
                                            <span className="order-card__item-subtotal">{item.subtotal} €</span>
                                        </div>
                                    ))}
                                </div>

                                <div className="order-card__footer">
                                    <div>
                                        <p className="order-card__total-label">Total</p>
                                        <p className="order-card__total-amount">{order.total} €</p>
                                    </div>
                                    <button onClick={() => handleDownloadInvoice(order.id)} className="order-card__invoice-btn">
                                        Descargar Factura
                                    </button>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
}

export default Profile;