package com.streetshop.controller;

import com.streetshop.model.Product;
import com.streetshop.model.ProductImage;
import com.streetshop.repository.ProductImageRepository;
import com.streetshop.repository.ProductRepository;
import com.streetshop.service.CloudinaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductImageRepository productImageRepository;

    @Autowired
    private CloudinaryService cloudinaryService;

    @GetMapping
    public ResponseEntity<List<Product>> getAllProducts() {
        return ResponseEntity.ok(productRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        return productRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/{id}/images")
    public ResponseEntity<List<ProductImage>> getProductImages(@PathVariable Long id) {
        return ResponseEntity.ok(
                productImageRepository.findByProductIdOrderByDisplayOrderAsc(id)
        );
    }

    @GetMapping("/brand/{brand}")
    public ResponseEntity<List<Product>> getProductsByBrand(@PathVariable String brand) {
        return ResponseEntity.ok(productRepository.findByBrand(brand));
    }

    @GetMapping("/category/{categoryId}")
    public ResponseEntity<List<Product>> getProductsByCategory(@PathVariable Long categoryId) {
        return ResponseEntity.ok(productRepository.findByCategoryId(categoryId));
    }

    @GetMapping("/search")
    public ResponseEntity<List<Product>> searchProducts(@RequestParam String name) {
        return ResponseEntity.ok(productRepository.findByNameContainingIgnoreCase(name));
    }

    @PostMapping
    public ResponseEntity<?> createProduct(
            @RequestParam("name")        String name,
            @RequestParam("brand")       String brand,
            @RequestParam("price")       BigDecimal price,
            @RequestParam("categoryId")  Long categoryId,
            @RequestParam("description") String description,
            @RequestParam("images")      List<MultipartFile> images) {

        try {
            Product product = new Product();
            product.setName(name);
            product.setBrand(brand);
            product.setPrice(price);
            product.setCategoryId(categoryId);
            product.setDescription(description);
            product.setCreatedAt(LocalDateTime.now());
            product.setUpdatedAt(LocalDateTime.now());

            Product saved = productRepository.save(product);

            for (int i = 0; i < images.size(); i++) {
                String imageUrl = cloudinaryService.uploadImage(images.get(i));

                ProductImage pi = new ProductImage();
                pi.setProductId(saved.getId());
                pi.setImageUrl(imageUrl);
                pi.setIsPrimary(i == 0);
                pi.setDisplayOrder(i);
                pi.setCreatedAt(LocalDateTime.now());
                productImageRepository.save(pi);

                if (i == 0) {
                    saved.setImageUrl(imageUrl);
                    productRepository.save(saved);
                }
            }

            return ResponseEntity.ok(saved);

        } catch (Exception e) {
            return ResponseEntity.internalServerError()
                    .body(Map.of("error", "Error creando el producto: " + e.getMessage()));
        }
    }

    @PostMapping("/{id}/images")
    public ResponseEntity<?> addProductImages(
            @PathVariable Long id,
            @RequestParam("images") List<MultipartFile> images) {

        return productRepository.findById(id)
                .map(product -> {
                    try {
                        List<ProductImage> existing =
                                productImageRepository.findByProductIdOrderByDisplayOrderAsc(id);
                        int startOrder = existing.size();
                        boolean hasNoImages = existing.isEmpty();

                        for (int i = 0; i < images.size(); i++) {
                            String imageUrl = cloudinaryService.uploadImage(images.get(i));

                            ProductImage pi = new ProductImage();
                            pi.setProductId(id);
                            pi.setImageUrl(imageUrl);
                            pi.setIsPrimary(hasNoImages && i == 0);
                            pi.setDisplayOrder(startOrder + i);
                            pi.setCreatedAt(LocalDateTime.now());
                            productImageRepository.save(pi);

                            if (hasNoImages && i == 0) {
                                product.setImageUrl(imageUrl);
                                product.setUpdatedAt(LocalDateTime.now());
                                productRepository.save(product);
                            }
                        }

                        List<ProductImage> all =
                                productImageRepository.findByProductIdOrderByDisplayOrderAsc(id);
                        return ResponseEntity.ok(all);

                    } catch (Exception e) {
                        return ResponseEntity.internalServerError()
                                .body(Map.of("error", "Error subiendo imágenes: " + e.getMessage()));
                    }
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/images/{imageId}")
    public ResponseEntity<?> deleteProductImage(@PathVariable Long imageId) {
        return productImageRepository.findById(imageId)
                .map(image -> {
                    productImageRepository.delete(image);
                    return ResponseEntity.ok(Map.of("message", "Imagen eliminada"));
                })
                .orElse(ResponseEntity.notFound().build());
    }
}