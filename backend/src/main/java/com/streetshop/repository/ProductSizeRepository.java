package com.streetshop.repository;

import com.streetshop.model.ProductSize;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductSizeRepository extends JpaRepository<ProductSize, Long> {
    List<ProductSize> findByProductId(Long productId);
    Optional<ProductSize> findByProductIdAndSize(Long productId, String size);
    List<ProductSize> findByProductIdAndStockGreaterThan(Long productId, Integer stock);
}