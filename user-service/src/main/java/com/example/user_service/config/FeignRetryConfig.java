package com.example.user_service.config;

import feign.Retryer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class FeignRetryConfig {
    @Bean
    public Retryer retryer() {
        return new Retryer.Default(
                100,
                1000,
                3);
    } // Important: 3 ka matlab total 3 attempts hai, 3 retries after the first attempt nahi.
}
