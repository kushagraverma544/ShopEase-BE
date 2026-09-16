package com.example.inventory_service.dto.internal;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;
import java.util.List;
import lombok.Data;

// user-service ke SellerProfile.initialProduct se aata hai — seller apply karte hi isi request se
// ek naya (inactive) product ban jaata hai.
@Data
public class CreateProductRequest {

    @NotNull(message = "sellerId is required")
    private Long sellerId;

    @NotBlank(message = "name is required")
    private String name;

    private String brand;

    private String category;

    private String description;

    @NotNull(message = "price is required")
    @Positive(message = "price must be greater than 0")
    private BigDecimal price;

    private BigDecimal discountPercentage;

    @NotNull(message = "stock is required")
    @PositiveOrZero(message = "stock cannot be negative")
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
