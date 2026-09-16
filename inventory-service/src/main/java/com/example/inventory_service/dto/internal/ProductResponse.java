package com.example.inventory_service.dto.internal;

import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// user-service ko wapas jaata hai — SellerProfile pe "productId" store karne ke liye "id" chahiye.
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductResponse {

    private Long id;
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
    private boolean active;
}
