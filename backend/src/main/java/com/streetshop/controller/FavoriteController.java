package com.streetshop.controller;

import com.streetshop.model.Favorite;
import com.streetshop.model.Product;
import com.streetshop.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/favorites")
public class FavoriteController {

    @Autowired
    private FavoriteService favoriteService;

    private Long getCurrentUserId() {
        return 1L;
    }

    @GetMapping
    public ResponseEntity<List<Product>> getFavorites() {
        List<Product> favorites = favoriteService.getFavorites(getCurrentUserId());
        return ResponseEntity.ok(favorites);
    }

    @PostMapping("/{productId}")
    public ResponseEntity<?> addFavorite(@PathVariable Long productId) {
        try {
            Favorite favorite = favoriteService.addFavorite(getCurrentUserId(), productId);
            Map<String, Object> response = new HashMap<>();
            response.put("message", "Producto añadido a favoritos");
            response.put("favoriteId", favorite.getId());
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<?> removeFavorite(@PathVariable Long productId) {
        try {
            favoriteService.removeFavorite(getCurrentUserId(), productId);
            return ResponseEntity.ok(Map.of("message", "Producto eliminado de favoritos"));
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @GetMapping("/check/{productId}")
    public ResponseEntity<?> checkFavorite(@PathVariable Long productId) {
        boolean isFavorite = favoriteService.isFavorite(getCurrentUserId(), productId);
        return ResponseEntity.ok(Map.of("isFavorite", isFavorite));
    }
}