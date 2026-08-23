package com.example.order_service.service;

import com.example.order_service.dto.OrderDto;
import java.util.List;

public interface OrderService {
    List<OrderDto> getOrders();

    OrderDto getOrderById(Long id);

    OrderDto createOrder(OrderDto orderDto);
}
