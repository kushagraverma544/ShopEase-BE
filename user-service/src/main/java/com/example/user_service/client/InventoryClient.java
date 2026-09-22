package com.example.user_service.client;

import com.example.user_service.config.FeignRetryConfig;
import com.example.user_service.dto.external.InventoryCreateProductRequest;
import com.example.user_service.dto.external.InventoryProductResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "inventory-service", configuration = FeignRetryConfig.class)
public interface InventoryClient {

    @PostMapping("/internal/products")
    InventoryProductResponse createProduct(@RequestBody InventoryCreateProductRequest request);

    @PatchMapping("/internal/products/{id}/activate")
    InventoryProductResponse activateProduct(@PathVariable Long id);
}
