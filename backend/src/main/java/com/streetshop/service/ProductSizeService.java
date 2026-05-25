package com.streetshop.service;

import com.streetshop.model.ProductSize;
import com.streetshop.repository.ProductSizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductSizeService {

    @Autowired
    private ProductSizeRepository productSizeRepository;

    public List<ProductSize> getProductSizes(Long productId) {
        return productSizeRepository.findByProductId(productId);
    }

    public List<ProductSize> getAvailableSizes(Long productId) {
        return productSizeRepository.findByProductIdAndStockGreaterThan(productId, 0);
    }

    public ProductSize getStock(Long productId, String size) {
        return productSizeRepository.findByProductIdAndSize(productId, size)
                .orElseThrow(() -> new RuntimeException("Talla no encontrada"));
    }

    public ProductSize updateStock(Long productId, String size, Integer newStock) {
        ProductSize productSize = productSizeRepository.findByProductIdAndSize(productId, size)
                .orElseThrow(() -> new RuntimeException("Talla no encontrada"));
        
        productSize.setStock(newStock);
        return productSizeRepository.save(productSize);
    }

    public boolean hasStock(Long productId, String size, Integer quantity) {
        ProductSize productSize = productSizeRepository.findByProductIdAndSize(productId, size)
                .orElse(null);
        
        return productSize != null && productSize.getStock() >= quantity;
    }

    public void decreaseStock(Long productId, String size, Integer quantity) {
        ProductSize productSize = productSizeRepository.findByProductIdAndSize(productId, size)
                .orElseThrow(() -> new RuntimeException("Talla no encontrada"));
        
        if (productSize.getStock() < quantity) {
            throw new RuntimeException("Stock insuficiente");
        }
        
        productSize.setStock(productSize.getStock() - quantity);
        productSizeRepository.save(productSize);
    }
}