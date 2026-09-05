package com.example.order_service.service.impl;

import com.example.order_service.controller.UserDto;
import com.example.order_service.dto.CreateOrderRequest;
import com.example.order_service.dto.OrderDto;
import com.example.order_service.entity.IdempotencyKey;
import com.example.order_service.entity.IdempotencyStatus;
import com.example.order_service.entity.Order;
import com.example.order_service.entity.OrderStatus;
import com.example.order_service.exception.ConflictException;
import com.example.order_service.exception.ResourceNotFoundException;
import com.example.order_service.repository.OrderRepository;
import com.example.order_service.service.IdempotencyReservation;
import com.example.order_service.service.IdempotencyService;
import com.example.order_service.service.OrderService;
import com.example.order_service.service.UserLookupService;

import java.util.List;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final UserLookupService userLookupService;
    private final IdempotencyService idempotencyService;

    @Override
    public List<OrderDto> getOrders() {
        return orderRepository.findAll().stream().map(this::toDto).toList();
    }

    @Override
    public OrderDto getOrderById(Long id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("order.not.found", id));
        return toDto(order);
    }

    @Override
    public OrderDto createOrder(String idempotencyKey, CreateOrderRequest request) {
        // Key turant (apni alag chhoti transaction me) reserve karo, downstream call se pehle.
        // Isse duplicate requests (same key) ko turant pata chal jata hai — 7s wait nahi karna padta.
        IdempotencyReservation reservation = idempotencyService.reserve(idempotencyKey);

        if (!reservation.newlyReserved()) {
            IdempotencyKey existing = reservation.keyRecord();
            if (existing.getStatus() == IdempotencyStatus.PROCESSING) {
                // Isi key wala ek request abhi bhi chal raha hai — naya kaam shuru mat karo.
                throw new ConflictException("idempotency.conflict");
            }
            // COMPLETED — pehle ka result hi wapas de do, downstream ko dobara touch mat karo.
            return idempotencyService.readStoredResponse(existing);
        }

        try {
            UserDto user = userLookupService.getUser(request.getUserId());    // Call to user-service to get user details & validate user existence.
            Order order = new Order();
            order.setUserId(request.getUserId());
            order.setProductName(request.getProductName());
            order.setQuantity(request.getQuantity());
            order.setAmount(request.getAmount());
            order.setStatus(OrderStatus.CREATED);    // Naya order hamesha CREATED se shuru hota hai — client isko override nahi kar sakta.
            OrderDto response = toDto(orderRepository.save(order));
            idempotencyService.markCompleted(idempotencyKey, response);
            return response;
        } catch (Exception e) {
            // Request genuinely fail hui — reservation chhod do taaki isi key se retry ho sake.
            idempotencyService.releaseReservation(idempotencyKey);
            throw e;
        }
    }

    @Override
    public OrderDto updateStatus(Long id, OrderStatus newStatus) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("order.not.found", id));

        if (!order.getStatus().canTransitionTo(newStatus)) {
            throw new ConflictException("order.status.invalid.transition", order.getStatus(), newStatus);
        }

        order.setStatus(newStatus);
        return toDto(orderRepository.save(order));
    }

    private OrderDto toDto(Order order) {
        return new OrderDto(order.getId(), order.getUserId(), order.getProductName(),
                order.getQuantity(), order.getAmount(), order.getStatus());
    }

}
