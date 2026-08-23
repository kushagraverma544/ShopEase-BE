package com.example.order_service.service.impl;

import com.example.order_service.client.UserClient;
import com.example.order_service.controller.UserDto;
import com.example.order_service.dto.OrderDto;
import com.example.order_service.entity.Order;
import com.example.order_service.entity.OrderStatus;
import com.example.order_service.repository.OrderRepository;
import com.example.order_service.service.OrderService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final UserClient userClient;

    @Override
    public List<OrderDto> getOrders() {
        return orderRepository.findAll().stream().map(this::toDto).toList();
    }

    @Override
    public OrderDto getOrderById(Long id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
        return toDto(order);
    }

    @Override
    public OrderDto createOrder(OrderDto orderDto) {
        UserDto user = userClient.getUserById(orderDto.getUserId());    // Call to user-service to get user details & validate user existence.
        Order order = new Order();
        order.setUserId(orderDto.getUserId());
        order.setProductName(orderDto.getProductName());
        order.setQuantity(orderDto.getQuantity());
        order.setAmount(orderDto.getAmount());
        order.setStatus(orderDto.getStatus() == null ? OrderStatus.CREATED : orderDto.getStatus());
        return toDto(orderRepository.save(order));
    }

    private OrderDto toDto(Order order) {
        return new OrderDto(order.getId(), order.getUserId(), order.getProductName(),
                order.getQuantity(), order.getAmount(), order.getStatus());
    }
}
