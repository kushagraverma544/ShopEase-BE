package com.example.order_service.dto;

import com.example.order_service.entity.OrderStatus;
import lombok.Data;

@Data
public class UpdateOrderStatusRequest {
    private OrderStatus status;
}
