import toast from 'react-hot-toast';
import React, { useState, useEffect } from 'react';
import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8080';

function OrdersAdmin() {
    const [orders, setOrders] = useState([]);
    const [loading, setLoading] = useState(true);
    const [expandedOrder, setExpandedOrder] = useState(null);

    useEffect(() => {
        loadOrders();
    }, []);

    const loadOrders = async () => {
        try {
            const token = localStorage.getItem('token');
            const response = await axios.get(`${API_URL}/api/admin/orders`, {
                headers: { Authorization: `Bearer ${token}` }
            });
            setOrders(response.data);
            setLoading(false);
        } catch (err) {
            console.error('Error cargando pedidos:', err);
            setLoading(false);
        }
    };

    const handleStatusChange = async (orderId, newStatus) => {
        try {
            const token = localStorage.getItem('token');
            await axios.put(
                `${API_URL}/api/admin/orders/${orderId}/status?status=${newStatus}`,
                {},
                { headers: { Authorization: `Bearer ${token}` }}
            );
            toast.success('Estado actualizado');
            loadOrders();
        } catch (err) {
            toast.error('Error actualizando estado');
        }
    };

    const toggleDetail = (orderId) => {
        setExpandedOrder(prev => prev === orderId ? null : orderId);
    };

    const getStatusBadgeClass = (status) => {
        const classes = {
            PENDING: 'orders-admin__badge--pending',
            PAID: 'orders-admin__badge--paid',
            SHIPPED: 'orders-admin__badge--shipped',
            DELIVERED: 'orders-admin__badge--delivered',
        };
        return `orders-admin__badge ${classes[status] || ''}`;
    };

    const getStatusText = (status) => {
        const texts = {
            PENDING: 'Pendiente',
            PAID: 'Pagado',
            SHIPPED: 'Enviado',
            DELIVERED: 'Entregado',
        };
        return texts[status] || status;
    };

    if (loading) return <div className="orders-admin__loading">Cargando pedidos...</div>;

    return (
        <div className="orders-admin">
            <div className="admin__card">
                <h2 className="admin__card-title">Gestión de Pedidos</h2>

                {orders.length === 0 ? (
                    <p className="orders-admin__empty">No hay pedidos todavía</p>
                ) : (
                    <div className="orders-admin__list">
                        {orders.map(order => (
                            <div key={order.id} className="orders-admin__item">
                                {/* Cabecera */}
                                <div className="orders-admin__header">
                                    <div>
                                        <h3 className="orders-admin__number">#{order.orderNumber}</h3>
                                        <p className="orders-admin__date">
                                            {new Date(order.createdAt).toLocaleDateString('es-ES', {
                                                day: 'numeric',
                                                month: 'long',
                                                year: 'numeric',
                                                hour: '2-digit',
                                                minute: '2-digit'
                                            })}
                                        </p>
                                    </div>
                                    <span className={getStatusBadgeClass(order.status)}>
                                        {getStatusText(order.status)}
                                    </span>
                                </div>

                                {/* Info básica */}
                                <div className="orders-admin__details">
                                    <p><strong>Total:</strong> {order.total} €</p>
                                    <p><strong>Email:</strong> {order.buyerEmail || '—'}</p>
                                    <p><strong>Dirección:</strong> {order.shippingAddress}</p>
                                    <p><strong>Teléfono:</strong> {order.phone}</p>
                                </div>

                                {/* Botón ver detalle */}
                                <button
                                    type="button"
                                    className="orders-admin__toggle-btn"
                                    onClick={() => toggleDetail(order.id)}
                                >
                                    {expandedOrder === order.id ? 'Ocultar productos ▲' : `Ver productos (${order.items?.length ?? 0}) ▼`}
                                </button>

                                {/* Detalle de items */}
                                {expandedOrder === order.id && (
                                    <div className="orders-admin__items">
                                        {order.items && order.items.length > 0 ? (
                                            <table className="orders-admin__table">
                                                <thead>
                                                    <tr>
                                                        <th>Producto</th>
                                                        <th>Marca</th>
                                                        <th>Talla</th>
                                                        <th>Cantidad</th>
                                                        <th>Precio</th>
                                                        <th>Subtotal</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {order.items.map(item => (
                                                        <tr key={item.id}>
                                                            <td>{item.productName}</td>
                                                            <td>{item.brand}</td>
                                                            <td>{item.size || '—'}</td>
                                                            <td>{item.quantity}</td>
                                                            <td>{item.price} €</td>
                                                            <td>{item.subtotal} €</td>
                                                        </tr>
                                                    ))}
                                                </tbody>
                                            </table>
                                        ) : (
                                            <p className="orders-admin__no-items">Sin productos registrados</p>
                                        )}
                                    </div>
                                )}
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
}

export default OrdersAdmin;