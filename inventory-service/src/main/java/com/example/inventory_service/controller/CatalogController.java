package com.example.inventory_service.controller;

import com.example.inventory_service.dto.CategoryDto;
import com.example.inventory_service.dto.ProductDetailDto;
import com.example.inventory_service.dto.ProductListResponse;
import com.example.inventory_service.service.ExternalProductService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// "/catalog" jaanbujh kar "/products" se alag rakha hai — "/products" hamari apni DB (products table)
// ke future CRUD ke liye reserve hai, ye endpoint sirf external (dummyjson) data browse karne ke liye hai.
@RestController
@RequiredArgsConstructor
@RequestMapping("/catalog/products")
public class CatalogController {

    private final ExternalProductService externalProductService;

    @GetMapping
    public ProductListResponse getProducts(
            @RequestParam(defaultValue = "30") int limit,
            @RequestParam(defaultValue = "0") int offset,
            @RequestParam(required = false) String sortBy,
            @RequestParam(required = false) String order) {
        return externalProductService.getProducts(limit, offset, sortBy, order);
    }

    @GetMapping("/{id}")
    public ProductDetailDto getProductById(@PathVariable Long id) {
        return externalProductService.getProductById(id);
    }

    @GetMapping("/search")
    public ProductListResponse searchProducts(
            @RequestParam String q,
            @RequestParam(defaultValue = "30") int limit,
            @RequestParam(defaultValue = "0") int offset) {
        return externalProductService.searchProducts(q, limit, offset);
    }

    @GetMapping("/categories")
    public List<CategoryDto> getCategories() {
        return externalProductService.getCategories();
    }

    @GetMapping("/category-list")
    public List<String> getCategoryList() {
        return externalProductService.getCategoryList();
    }

    @GetMapping("/category/{category}")
    public ProductListResponse getProductsByCategory(
            @PathVariable String category,
            @RequestParam(defaultValue = "30") int limit,
            @RequestParam(defaultValue = "0") int offset) {
        return externalProductService.getProductsByCategory(category, limit, offset);
    }
}
