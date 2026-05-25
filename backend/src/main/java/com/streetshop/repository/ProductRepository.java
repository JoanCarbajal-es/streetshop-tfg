package com.streetshop.repository;

import com.streetshop.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    
    // Buscar por marca
    List<Product> findByBrand(String brand);
    
    // Buscar por categoría
    List<Product> findByCategoryId(Long categoryId);
    
    // Buscar por nombre (contiene)
    List<Product> findByNameContainingIgnoreCase(String name);
}