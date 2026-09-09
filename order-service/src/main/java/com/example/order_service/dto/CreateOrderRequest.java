package com.example.order_service.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import java.math.BigDecimal;
import lombok.Data;

// Order creation ke liye alag request DTO — "status" yahan jaanbujh kar nahi hai,
// client order create karte waqt uska status decide nahi kar sakta, hamesha CREATED se hi shuru hota hai.
@Data
public class CreateOrderRequest {

    @NotNull(message = "userId is required")
    private Long userId;

    @NotBlank(message = "productName is required")
    private String productName;

    @NotNull(message = "quantity is required")
    @Positive(message = "quantity must be greater than 0")
    private Integer quantity;

    @NotNull(message = "amount is required")
    @Positive(message = "amount must be greater than 0")
    private BigDecimal amount;
}
