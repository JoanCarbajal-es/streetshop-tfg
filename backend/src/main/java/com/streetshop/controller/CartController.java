package com.streetshop.controller;

import com.streetshop.dto.AddToCartRequest;
import com.streetshop.dto.CartItemResponse;
import com.streetshop.model.CartItem;
import com.streetshop.model.User;
import com.streetshop.service.CartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    // TODO: Cuando implementes autenticación JWT, obtén el userId del token
    // Por ahora usamos un userId fijo para pruebas
    private Long getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        User user = (User) authentication.getPrincipal();

        return user.getId();
    }

    @GetMapping
    public ResponseEntity<List<CartItemResponse>> getCart() {
        List<CartItemResponse> items = cartService.getCartItems(getCurrentUserId());
        return ResponseEntity.ok(items);
    }

    @PostMapping("/add")
    public ResponseEntity<?> addToCart(@RequestBody AddToCartRequest request) {
        try {
            CartItem item = cartService.addToCart(getCurrentUserId(), request);
            Map<String, Object> response = new HashMap<>();
            response.put("message", "Producto añadido al carrito");
            response.put("cartItemId", item.getId());
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @PutMapping("/{itemId}")
    public ResponseEntity<?> updateQuantity(
            @PathVariable Long itemId,
            @RequestParam Integer quantity) {
        try {
            cartService.updateQuantity(getCurrentUserId(), itemId, quantity);
            return ResponseEntity.ok(Map.of("message", "Cantidad actualizada"));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @DeleteMapping("/{itemId}")
    public ResponseEntity<?> removeItem(@PathVariable Long itemId) {
        try {
            cartService.removeItem(getCurrentUserId(), itemId);
            return ResponseEntity.ok(Map.of("message", "Producto eliminado del carrito"));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @DeleteMapping("/clear")
    public ResponseEntity<?> clearCart() {
        cartService.clearCart(getCurrentUserId());
        return ResponseEntity.ok(Map.of("message", "Carrito vaciado"));
    }
}