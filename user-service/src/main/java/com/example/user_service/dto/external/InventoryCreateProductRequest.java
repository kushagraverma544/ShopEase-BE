package com.example.user_service.dto.external;

import java.math.BigDecimal;
import java.util.List;
import lombok.Data;

// inventory-service ke POST /internal/products ka request contract — service boundary cross
// karte hain isliye alag copy hai, koi shared library nahi (per-service duplication, jaanbujh kar).
@Data
public class InventoryCreateProductRequest {
    private Long sellerId;
    private String name;
    private String brand;
    private String category;
    private String description;
    private BigDecimal price;
    private BigDecimal discountPercentage;
    private Integer stock;
    private Integer minimumOrderQuantity;
    private String sku;
    private List<String> tags;
    private Double weight;
    private Double width;
    private Double height;
    private Double depth;
    private String warrantyInformation;
    private String shippingInformation;
    private String returnPolicy;
}
