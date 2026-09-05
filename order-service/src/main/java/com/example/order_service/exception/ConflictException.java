package com.example.order_service.exception;

public class ConflictException extends ApiException {
    public ConflictException(String messageKey, Object... args) {
        super(messageKey, args);
    }
}
