package com.example.order_service.service;

import com.example.order_service.client.UserClient;
import com.example.order_service.controller.UserDto;
import com.example.order_service.exception.DownstreamServiceException;
import com.example.order_service.exception.ResourceNotFoundException;
import feign.FeignException;
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
        try {
            return userClient.getUserById(userId);
        } catch (FeignException.NotFound e) {
            // User genuinely exist nahi karta — ye business error hai, downstream "down" nahi hai.
            // ignore-exceptions (application.yaml) isse circuit ke failure-rate me count hone se rokta hai,
            // aur neeche wala specific-type fallback overload isse generic "unavailable" banne se rokta hai.
            throw new ResourceNotFoundException("user.not.found", userId);
        }
    }

    // Resilience4j sabse specific-matching fallback method choose karta hai — isliye ResourceNotFoundException
    // ke liye alag overload zaroori hai, warna neeche wala generic Throwable overload ise bhi pakad leta
    // (jaisa pehle ho raha tha: "user not found" bhi "service unavailable" ban raha tha).
    public UserDto getUserFallback(Long userId, ResourceNotFoundException e) {
        throw e;
    }

    public UserDto getUserFallback(Long userId, Throwable t) {
        log.warn("Fallback triggered for userId={}, reason={}", userId, t.getMessage());
        throw new DownstreamServiceException("downstream.unavailable");
    }
}
