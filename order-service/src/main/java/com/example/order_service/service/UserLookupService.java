package com.example.order_service.service;

import com.example.order_service.client.UserClient;
import com.example.order_service.controller.UserDto;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

// Circuit breaker sirf isi downstream call ko protect karta hai —
// idempotency/DB logic isse bahar hai, taaki unrelated failures user-service ke circuit ko na trip karein.
@Service
@RequiredArgsConstructor
@Slf4j
public class UserLookupService {

    private final UserClient userClient;

    @CircuitBreaker(name = "user-service", fallbackMethod = "getUserFallback")
    public UserDto getUser(Long userId) {
        return userClient.getSlowUser(userId);
    }

    public UserDto getUserFallback(Long userId, Throwable t) {
        log.warn("Fallback triggered for userId={}, reason={}", userId, t.getMessage());
        throw new RuntimeException("Order service is currently unavailable, please try again later");
    }
}
