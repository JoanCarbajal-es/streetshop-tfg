package com.streetshop.controller;

import com.streetshop.model.Category;
import com.streetshop.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/categories")
public class AdminCategoryController {

    @Autowired
    private CategoryRepository categoryRepository;

    @PostMapping
    public ResponseEntity<?> createCategory(@RequestBody Category category) {
        try {
            category.setCreatedAt(LocalDateTime.now());
            Category saved = categoryRepository.save(category);
            return ResponseEntity.ok(saved);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateCategory(@PathVariable Long id, @RequestBody Category category) {
        try {
            Category existing = categoryRepository.findById(id)
                    .orElseThrow(() -> new RuntimeException("Categoría no encontrada"));

            existing.setName(category.getName());
            existing.setSlug(category.getSlug());

            Category updated = categoryRepository.save(existing);
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCategory(@PathVariable Long id) {
        try {
            if (!categoryRepository.existsById(id)) {
                throw new RuntimeException("Categoría no encontrada");
            }
            categoryRepository.deleteById(id);
            return ResponseEntity.ok(Map.of("message", "Categoría eliminada correctamente"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }
}