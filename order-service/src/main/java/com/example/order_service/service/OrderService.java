package com.example.order_service.service;

import com.example.order_service.dto.CreateOrderRequest;
import com.example.order_service.dto.OrderDto;
import com.example.order_service.entity.OrderStatus;
import java.util.List;

public interface OrderService {
    List<OrderDto> getOrders();

    OrderDto getOrderById(Long id);

    OrderDto createOrder(String idempotencyKey, CreateOrderRequest request);

    OrderDto updateStatus(Long id, OrderStatus newStatus);
}
