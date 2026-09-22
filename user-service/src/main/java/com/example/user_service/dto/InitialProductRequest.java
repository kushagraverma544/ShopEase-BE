package com.example.user_service.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.PositiveOrZero;
import java.math.BigDecimal;
import java.util.List;
import lombok.Data;

// FE ke seller-registration form ka "initialProduct" block — seller apply karte hi isi se pehla
// product ban jaata hai (inventory-service mein, inactive), taaki dobara add na karna pade.
@Data
public class InitialProductRequest {

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

    @Valid
    private DimensionsRequest dimensions;

    private String warrantyInformation;

    private String shippingInformation;

    private String returnPolicy;
}
