package com.example.inventory_service.service;

import com.example.inventory_service.dto.internal.CreateProductRequest;
import com.example.inventory_service.dto.internal.ProductResponse;
import com.example.inventory_service.entity.Product;
import com.example.inventory_service.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

/**
 * Backs the internal endpoints user-service calls for seller-owned products — not part of the
 * public catalog surface (see {@link com.example.inventory_service.controller.CatalogController}
 * for that, which still proxies DummyJSON).
 */
@Service
@RequiredArgsConstructor
public class InternalProductService {

    private final ProductRepository productRepository;

    @Transactional
    public ProductResponse createProduct(CreateProductRequest request) {
        Product product = new Product();
        product.setSellerId(request.getSellerId());
        product.setName(request.getName());
        product.setBrand(request.getBrand());
        product.setCategory(request.getCategory());
        product.setDescription(request.getDescription());
        product.setPrice(request.getPrice());
        product.setDiscountPercentage(request.getDiscountPercentage());
        product.setStock(request.getStock());
        product.setMinimumOrderQuantity(request.getMinimumOrderQuantity());
        product.setSku(request.getSku());
        product.setTags(request.getTags());
        product.setWeight(request.getWeight());
        product.setWidth(request.getWidth());
        product.setHeight(request.getHeight());
        product.setDepth(request.getDepth());
        product.setWarrantyInformation(request.getWarrantyInformation());
        product.setShippingInformation(request.getShippingInformation());
        product.setReturnPolicy(request.getReturnPolicy());
        product.setActive(false);
        return toResponse(productRepository.save(product));
    }

    @Transactional
    public ProductResponse activateProduct(Long id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product not found: " + id));
        product.setActive(true);
        return toResponse(product);
    }

    private ProductResponse toResponse(Product product) {
        return new ProductResponse(product.getId(), product.getSellerId(), product.getName(), product.getBrand(),
                product.getCategory(), product.getDescription(), product.getPrice(),
                product.getDiscountPercentage(), product.getStock(), product.getMinimumOrderQuantity(),
                product.getSku(), product.getTags(), product.getWeight(), product.getWidth(), product.getHeight(),
                product.getDepth(), product.getWarrantyInformation(), product.getShippingInformation(),
                product.getReturnPolicy(), product.isActive());
    }
}
