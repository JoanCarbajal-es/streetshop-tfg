package com.streetshop.controller;

import com.streetshop.dto.OrderResponse;
import com.streetshop.model.Order;
import com.streetshop.repository.OrderItemRepository;
import com.streetshop.repository.OrderRepository;
import com.streetshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin/orders")
public class AdminOrderController {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public ResponseEntity<List<OrderResponse>> getAllOrders() {
        List<Order> orders = orderRepository.findAll();
        List<OrderResponse> responses = orders.stream().map(order -> {
            OrderResponse r = new OrderResponse();
            r.setId(order.getId());
            r.setOrderNumber(order.getOrderNumber());
            r.setTotal(order.getTotal());
            r.setStatus(order.getStatus());
            r.setShippingAddress(order.getShippingAddress());
            r.setPhone(order.getPhone());
            r.setPaymentMethod(order.getPaymentMethod());
            r.setCreatedAt(order.getCreatedAt());
            r.setItems(orderItemRepository.findByOrderId(order.getId()));
            userRepository.findById(order.getUserId())
                    .ifPresent(user -> r.setBuyerEmail(user.getEmail()));
            return r;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(responses);
    }

    @PutMapping("/{id}/status")
    public ResponseEntity<?> updateOrderStatus(
            @PathVariable Long id,
            @RequestParam String status) {
        try {
            Order order = orderRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Pedido no encontrado"));
            order.setStatus(status);
            Order updated = orderRepository.save(order);
            return ResponseEntity.ok(Map.of("message", "Estado actualizado", "order", updated));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}