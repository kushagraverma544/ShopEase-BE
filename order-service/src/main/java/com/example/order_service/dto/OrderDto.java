package com.example.order_service.dto;

import com.example.order_service.entity.OrderStatus;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {
    private Long id;
    private Long userId;
    private String productName;
    private Integer quantity;
    private BigDecimal amount;
    private OrderStatus status;
}
