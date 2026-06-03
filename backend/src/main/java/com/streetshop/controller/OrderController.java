package com.streetshop.controller;

import com.streetshop.dto.CreateOrderRequest;
import com.streetshop.dto.OrderResponse;
import com.streetshop.model.User;
import com.streetshop.service.InvoiceService;
import com.streetshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private InvoiceService invoiceService;

    private Long getCurrentUserId(Authentication authentication) {
        if (authentication == null) {
            throw new RuntimeException("Usuario no autenticado");
        }
        User user = (User) authentication.getPrincipal();
        return user.getId();
    }

    @PostMapping
    public ResponseEntity<?> createOrder(@RequestBody CreateOrderRequest request, Authentication authentication) {
        try {
            Long userId = getCurrentUserId(authentication);
            OrderResponse order = orderService.createOrder(userId, request);
            return ResponseEntity.ok(order);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping
    public ResponseEntity<List<OrderResponse>> getMyOrders(Authentication authentication) {
        Long userId = getCurrentUserId(authentication);
        List<OrderResponse> orders = orderService.getUserOrders(userId);
        return ResponseEntity.ok(orders);
    }

    @GetMapping("/{orderId}")
    public ResponseEntity<?> getOrderById(@PathVariable Long orderId, Authentication authentication) {
        try {
            Long userId = getCurrentUserId(authentication);
            OrderResponse order = orderService.getOrderById(userId, orderId);
            return ResponseEntity.ok(order);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @GetMapping("/{orderId}/invoice")
    public ResponseEntity<byte[]> downloadInvoice(@PathVariable Long orderId, Authentication authentication) {
        try {
            Long userId = getCurrentUserId(authentication);
            orderService.getOrderById(userId, orderId);
            byte[] pdfBytes = invoiceService.generateInvoicePDF(orderId);
            return ResponseEntity.ok()
                    .header("Content-Type", "application/pdf")
                    .header("Content-Disposition", "attachment; filename=factura-" + orderId + ".pdf")
                    .body(pdfBytes);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}