package com.example.order_service.exception;

public class ResourceNotFoundException extends ApiException {
    public ResourceNotFoundException(String messageKey, Object... args) {
        super(messageKey, args);
    }
}
