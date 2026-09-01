package com.example.order_service.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import feign.Retryer;

@Configuration
public class FeignRetryConfig {
    @Bean
    public Retryer retryer() {
        return new Retryer.Default(
                100,
                1000,
                3);
    } // Important: 3 ka matlab total 3 attempts hai, 3 retries after the first
      // attempt nahi.
}
