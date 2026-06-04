import toast from 'react-hot-toast';
import React, { useState, useEffect } from 'react';
import axios from 'axios';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8080';

function OrdersAdmin() {
    const [orders, setOrders] = useState([]);
    const [loading, setLoading] = useState(true);

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

                                <div className="orders-admin__details">
                                    <p><strong>Total:</strong> {order.total} €</p>
                                    <p><strong>Dirección:</strong> {order.shippingAddress}</p>
                                    <p><strong>Teléfono:</strong> {order.phone}</p>
                                </div>

                                <div className="orders-admin__status">
                                    <label className="admin__label">Cambiar estado:</label>
                                    <select
                                        value={order.status}
                                        onChange={(e) => handleStatusChange(order.id, e.target.value)}
                                        className="admin__select"
                                    >
                                        <option value="PENDING">Pendiente</option>
                                        <option value="PAID">Pagado</option>
                                        <option value="SHIPPED">Enviado</option>
                                        <option value="DELIVERED">Entregado</option>
                                    </select>
                                </div>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
}

export default OrdersAdmin;