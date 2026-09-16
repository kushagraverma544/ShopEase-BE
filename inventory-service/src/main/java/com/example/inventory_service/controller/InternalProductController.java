package com.example.inventory_service.controller;

import com.example.inventory_service.dto.internal.CreateProductRequest;
import com.example.inventory_service.dto.internal.ProductResponse;
import com.example.inventory_service.service.InternalProductService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Sirf user-service call karta hai (seller apply/approve flow) — public catalog surface nahi hai,
// wo CatalogController hai. Koi auth abhi nahi hai — inventory-service mein bilkul koi security
// dependency nahi hai, order-service ke khule /users/** jaisa hi known gap hai (service-to-service
// auth abhi tak nahi bana).
@RestController
@RequiredArgsConstructor
@RequestMapping("/internal/products")
public class InternalProductController {

    private final InternalProductService internalProductService;

    @PostMapping
    public ResponseEntity<ProductResponse> createProduct(@Valid @RequestBody CreateProductRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(internalProductService.createProduct(request));
    }

    @PatchMapping("/{id}/activate")
    public ProductResponse activateProduct(@PathVariable Long id) {
        return internalProductService.activateProduct(id);
    }
}
