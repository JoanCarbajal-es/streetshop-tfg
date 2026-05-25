package com.streetshop.service;

import com.streetshop.dto.CartItemResponse;
import com.streetshop.dto.CreateOrderRequest;
import com.streetshop.dto.OrderResponse;
import com.streetshop.model.Order;
import com.streetshop.model.OrderItem;
import com.streetshop.model.User;
import com.streetshop.repository.OrderItemRepository;
import com.streetshop.repository.OrderRepository;
import com.streetshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private CartService cartService;

    @Autowired
    private BrevoEmailService brevoEmailService;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public OrderResponse createOrder(Long userId, CreateOrderRequest request) {
        System.out.println("🔵 INICIO DE CREACIÓN DE PEDIDO - Usuario ID: " + userId);
    
        List<CartItemResponse> cartItems = cartService.getCartItems(userId);
        
        // AÑADE ESTA LÍNEA PARA DEPURAR:
        System.out.println("📦 Cantidad de productos encontrados en DB: " + cartItems.size());
        
        if (cartItems.isEmpty()) {
            throw new RuntimeException("El carrito está vacío");
        }

        BigDecimal total = cartItems.stream()
                .map(CartItemResponse::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        Order order = new Order();
        order.setUserId(userId);
        order.setOrderNumber("ORD-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        order.setTotal(total);
        order.setStatus("PAID");
        order.setShippingAddress(request.getShippingAddress());
        order.setPhone(request.getPhone());
        order.setPaymentMethod("STRIPE");
        order.setCreatedAt(LocalDateTime.now());
        
        Order savedOrder = orderRepository.save(order);
        System.out.println("🟢 Pedido guardado - Número: " + savedOrder.getOrderNumber());

        List<OrderItem> orderItems = cartItems.stream().map(cartItem -> {
            OrderItem item = new OrderItem();
            item.setOrderId(savedOrder.getId());
            item.setProductId(cartItem.getProductId());
            item.setProductName(cartItem.getProductName());
            item.setBrand(cartItem.getBrand());
            item.setQuantity(cartItem.getQuantity());
            item.setSize(cartItem.getSize());
            item.setPrice(cartItem.getPrice());
            item.setSubtotal(cartItem.getSubtotal());
            return item;
        }).collect(Collectors.toList());

        orderItemRepository.saveAll(orderItems);
        cartService.clearCart(userId);

        // Lógica de envío de Email Dinámico
        try {
            User user = userRepository.findById(userId).orElse(null);
            if (user != null) {
                System.out.println("📧 Intentando enviar email de confirmación a: " + user.getEmail());
                brevoEmailService.sendOrderConfirmationEmail(
                    user.getEmail(),
                    user.getFullName(),
                    savedOrder,
                    orderItems
                );
                System.out.println("✅ Email de confirmación de pedido enviado correctamente");
            }
        } catch (Exception e) {
            System.err.println("❌ Error enviando email de confirmación: " + e.getMessage());
        }

        OrderResponse response = new OrderResponse();
        response.setId(savedOrder.getId());
        response.setOrderNumber(savedOrder.getOrderNumber());
        response.setTotal(savedOrder.getTotal());
        response.setStatus(savedOrder.getStatus());
        response.setShippingAddress(savedOrder.getShippingAddress());
        response.setPhone(savedOrder.getPhone());
        response.setPaymentMethod(savedOrder.getPaymentMethod());
        response.setCreatedAt(savedOrder.getCreatedAt());
        response.setItems(orderItems);

        return response;
    }

    public List<OrderResponse> getUserOrders(Long userId) {
        List<Order> orders = orderRepository.findByUserIdOrderByCreatedAtDesc(userId);
        return orders.stream().map(this::mapToResponse).collect(Collectors.toList());
    }

    public OrderResponse getOrderById(Long userId, Long orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Pedido no encontrado"));
        
        if (!order.getUserId().equals(userId)) {
            throw new RuntimeException("No autorizado");
        }
        return mapToResponse(order);
    }

    private OrderResponse mapToResponse(Order order) {
        OrderResponse response = new OrderResponse();
        response.setId(order.getId());
        response.setOrderNumber(order.getOrderNumber());
        response.setTotal(order.getTotal());
        response.setStatus(order.getStatus());
        response.setShippingAddress(order.getShippingAddress());
        response.setPhone(order.getPhone());
        response.setPaymentMethod(order.getPaymentMethod());
        response.setCreatedAt(order.getCreatedAt());
        response.setItems(orderItemRepository.findByOrderId(order.getId()));
        return response;
    }
}