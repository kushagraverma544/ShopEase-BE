package com.example.order_service.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.order_service.configuration.FeignRetryConfig;
import com.example.order_service.controller.UserDto;

@FeignClient(name = "user-service", configuration = FeignRetryConfig.class)
public interface UserClient {

    @GetMapping("/users/{id}")
    UserDto getUserById(@PathVariable Long id);

    @GetMapping("/users/slow/{id}")
    UserDto getSlowUser(@PathVariable Long id);
}
