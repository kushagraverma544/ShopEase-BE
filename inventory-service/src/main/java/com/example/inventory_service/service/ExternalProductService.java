package com.example.inventory_service.service;

import com.example.inventory_service.client.DummyProductClient;
import com.example.inventory_service.dto.CategoryDto;
import com.example.inventory_service.dto.ProductDetailDto;
import com.example.inventory_service.dto.ProductListResponse;
import com.example.inventory_service.dto.ProductSummaryDto;
import com.example.inventory_service.dto.external.ExternalProduct;
import com.example.inventory_service.dto.external.ExternalProductListResponse;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ExternalProductService {

    private final DummyProductClient dummyProductClient;

    public ProductListResponse getProducts(int limit, int offset, String sortBy, String order) {
        // FE seedha limit/offset bhejta hai — dummyjson ka "skip" wahi offset hai, koi conversion nahi chahiye.
        ExternalProductListResponse response = dummyProductClient.getProducts(limit, offset, sortBy, order);
        return toListResponse(response, limit, offset);
    }

    public ProductDetailDto getProductById(Long id) {
        return toDetailDto(dummyProductClient.getProductById(id));
    }

    public ProductListResponse searchProducts(String q, int limit, int offset) {
        ExternalProductListResponse response = dummyProductClient.searchProducts(q, limit, offset);
        return toListResponse(response, limit, offset);
    }

    public List<CategoryDto> getCategories() {
        return dummyProductClient.getCategories().stream()
                .map(category -> new CategoryDto(category.getSlug(), category.getName()))
                .toList();
    }

    public List<String> getCategoryList() {
        return dummyProductClient.getCategoryList();
    }

    public ProductListResponse getProductsByCategory(String category, int limit, int offset) {
        ExternalProductListResponse response = dummyProductClient.getProductsByCategory(category, limit, offset);
        return toListResponse(response, limit, offset);
    }

    private ProductListResponse toListResponse(ExternalProductListResponse response, int limit, int offset) {
        var content = response.getProducts().stream().map(this::toSummaryDto).toList();
        long totalElements = response.getTotal();
        int totalPages = limit == 0 ? 0 : (int) Math.ceil((double) totalElements / limit);
        return new ProductListResponse(content, limit, offset, totalElements, totalPages);
    }

    private ProductSummaryDto toSummaryDto(ExternalProduct product) {
        return new ProductSummaryDto(product.getId(), product.getTitle(), product.getPrice(), product.getStock(),
                product.getCategory(), product.getThumbnail());
    }

    private ProductDetailDto toDetailDto(ExternalProduct product) {
        return new ProductDetailDto(product.getId(), product.getTitle(), product.getDescription(),
                product.getCategory(), product.getPrice(), product.getDiscountPercentage(), product.getRating(),
                product.getStock(), product.getBrand(), product.getThumbnail(), product.getImages());
    }
}
