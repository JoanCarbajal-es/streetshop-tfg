package com.streetshop.controller;

import com.streetshop.model.ProductSize;
import com.streetshop.service.ProductSizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/products/{productId}/sizes")
public class ProductSizeController {

    @Autowired
    private ProductSizeService productSizeService;

    @GetMapping
    public ResponseEntity<List<ProductSize>> getProductSizes(@PathVariable Long productId) {
        List<ProductSize> sizes = productSizeService.getProductSizes(productId);
        return ResponseEntity.ok(sizes);
    }

    @GetMapping("/available")
    public ResponseEntity<List<ProductSize>> getAvailableSizes(@PathVariable Long productId) {
        List<ProductSize> sizes = productSizeService.getAvailableSizes(productId);
        return ResponseEntity.ok(sizes);
    }

    @GetMapping("/{size}")
    public ResponseEntity<?> getStock(@PathVariable Long productId, @PathVariable String size) {
        try {
            ProductSize productSize = productSizeService.getStock(productId, size);
            return ResponseEntity.ok(productSize);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @PutMapping("/{size}/stock")
    public ResponseEntity<?> updateStock(
            @PathVariable Long productId,
            @PathVariable String size,
            @RequestParam Integer stock) {
        try {
            ProductSize updated = productSizeService.updateStock(productId, size, stock);
            return ResponseEntity.ok(Map.of("message", "Stock actualizado", "size", updated));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}