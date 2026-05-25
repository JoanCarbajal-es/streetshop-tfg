package com.streetshop.service;

import com.streetshop.dto.AddToCartRequest;
import com.streetshop.dto.CartItemResponse;
import com.streetshop.model.CartItem;
import com.streetshop.model.Product;
import com.streetshop.repository.CartItemRepository;
import com.streetshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CartService {

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;

    public List<CartItemResponse> getCartItems(Long userId) {
        List<CartItem> cartItems = cartItemRepository.findByUserId(userId);
        
        return cartItems.stream().map(item -> {
            Product product = productRepository.findById(item.getProductId())
                    .orElseThrow(() -> new RuntimeException("Producto no encontrado"));
            
            CartItemResponse response = new CartItemResponse();
            response.setId(item.getId());
            response.setProductId(product.getId());
            response.setProductName(product.getName());
            response.setProductImage(product.getImageUrl());
            response.setBrand(product.getBrand());
            response.setQuantity(item.getQuantity());
            response.setSize(item.getSize());
            response.setPrice(item.getPrice());
            response.setSubtotal(item.getPrice().multiply(BigDecimal.valueOf(item.getQuantity())));
            
            return response;
        }).collect(Collectors.toList());
    }

    public CartItem addToCart(Long userId, AddToCartRequest request) {
        Product product = productRepository.findById(request.getProductId())
                .orElseThrow(() -> new RuntimeException("Producto no encontrado"));

        // Verificar si ya existe el mismo producto con la misma talla
        var existingItem = cartItemRepository.findByUserIdAndProductIdAndSize(
                userId, request.getProductId(), request.getSize());

        if (existingItem.isPresent()) {
            // Actualizar cantidad
            CartItem item = existingItem.get();
            item.setQuantity(item.getQuantity() + request.getQuantity());
            return cartItemRepository.save(item);
        } else {
            // Crear nuevo item
            CartItem newItem = new CartItem();
            newItem.setUserId(userId);
            newItem.setProductId(request.getProductId());
            newItem.setQuantity(request.getQuantity());
            newItem.setSize(request.getSize());
            newItem.setPrice(product.getPrice());
            newItem.setCreatedAt(LocalDateTime.now());
            return cartItemRepository.save(newItem);
        }
    }

    public void updateQuantity(Long userId, Long cartItemId, Integer quantity) {
        CartItem item = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Item no encontrado"));
        
        if (!item.getUserId().equals(userId)) {
            throw new RuntimeException("No autorizado");
        }
        
        item.setQuantity(quantity);
        cartItemRepository.save(item);
    }

    public void removeItem(Long userId, Long cartItemId) {
        CartItem item = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Item no encontrado"));
        
        if (!item.getUserId().equals(userId)) {
            throw new RuntimeException("No autorizado");
        }
        
        cartItemRepository.delete(item);
    }

    @Transactional
    public void clearCart(Long userId) {
        cartItemRepository.deleteByUserId(userId);
    }
}