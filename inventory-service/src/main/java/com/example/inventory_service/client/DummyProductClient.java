package com.example.inventory_service.client;

import com.example.inventory_service.dto.external.ExternalCategory;
import com.example.inventory_service.dto.external.ExternalProduct;
import com.example.inventory_service.dto.external.ExternalProductListResponse;
import java.util.List;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

// Fixed external URL — Eureka discovery yahan involved nahi hai (dummyjson koi registered service nahi hai),
// isliye "name" sirf Feign context ke liye ek identifier hai, load-balancing ke liye use nahi hota.
@FeignClient(name = "dummyjson-products", url = "https://dummyjson.com/products")
public interface DummyProductClient {

    @GetMapping
    ExternalProductListResponse getProducts(@RequestParam("limit") int limit, @RequestParam("skip") int skip,
            @RequestParam(value = "sortBy", required = false) String sortBy,
            @RequestParam(value = "order", required = false) String order);

    @GetMapping("/{id}")
    ExternalProduct getProductById(@PathVariable("id") Long id);

    @GetMapping("/search")
    ExternalProductListResponse searchProducts(@RequestParam("q") String q, @RequestParam("limit") int limit,
            @RequestParam("skip") int skip);

    @GetMapping("/categories")
    List<ExternalCategory> getCategories();

    @GetMapping("/category-list")
    List<String> getCategoryList();

    @GetMapping("/category/{category}")
    ExternalProductListResponse getProductsByCategory(@PathVariable("category") String category,
            @RequestParam("limit") int limit, @RequestParam("skip") int skip);
}
