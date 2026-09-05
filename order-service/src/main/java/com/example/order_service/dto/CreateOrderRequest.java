package com.example.order_service.dto;

import java.math.BigDecimal;
import lombok.Data;

// Order creation ke liye alag request DTO — "status" yahan jaanbujh kar nahi hai,
// client order create karte waqt uska status decide nahi kar sakta, hamesha CREATED se hi shuru hota hai.
@Data
public class CreateOrderRequest {
    private Long userId;
    private String productName;
    private Integer quantity;
    private BigDecimal amount;
}
