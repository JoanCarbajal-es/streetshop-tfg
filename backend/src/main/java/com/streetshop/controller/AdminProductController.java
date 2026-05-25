package com.streetshop.controller;

import com.streetshop.model.Product;
import com.streetshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/products")
public class AdminProductController {

    @Autowired
    private ProductRepository productRepository;


    @PostMapping
    public ResponseEntity<?> createProduct(@RequestBody Product product) {
        try {
            product.setCreatedAt(LocalDateTime.now());
            product.setUpdatedAt(LocalDateTime.now());
            Product saved = productRepository.save(product);
            return ResponseEntity.ok(saved);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateProduct(@PathVariable Long id, @RequestBody Product product) {
        try {
            Product existing = productRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Producto no encontrado"));

            existing.setName(product.getName());
            existing.setBrand(product.getBrand());
            existing.setPrice(product.getPrice());
            existing.setCategoryId(product.getCategoryId());
            existing.setDescription(product.getDescription());
            existing.setImageUrl(product.getImageUrl());
            existing.setUpdatedAt(LocalDateTime.now());

            Product updated = productRepository.save(existing);
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable Long id) {
        try {
            if (!productRepository.existsById(id)) {
                throw new RuntimeException("Producto no encontrado");
            }
            productRepository.deleteById(id);
            return ResponseEntity.ok(Map.of("message", "Producto eliminado correctamente"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}