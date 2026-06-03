import React, { createContext, useState, useContext, useEffect } from 'react';
import { getCart } from '../services/api';
import { useAuth } from './AuthContext';

const CartContext = createContext();

export const useCart = () => {
    const context = useContext(CartContext);
    if (!context) throw new Error('useCart debe usarse dentro de CartProvider');
    return context;
};

export const CartProvider = ({ children }) => {
    const [cartCount, setCartCount] = useState(0);
    const { isAuthenticated } = useAuth();

    const refreshCart = async () => {
        if (!isAuthenticated()) {
            setCartCount(0);
            return;
        }
        try {
            const response = await getCart();
            const total = response.data.reduce((sum, item) => sum + item.quantity, 0);
            setCartCount(total);
        } catch {
            setCartCount(0);
        }
    };

    const clearCartCount = () => setCartCount(0);

    useEffect(() => {
        refreshCart();
    }, [isAuthenticated()]);

    return (
        <CartContext.Provider value={{ cartCount, refreshCart, clearCartCount }}>
            {children}
        </CartContext.Provider>
    );
};