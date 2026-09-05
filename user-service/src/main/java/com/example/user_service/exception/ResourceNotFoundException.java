package com.example.user_service.exception;

public class ResourceNotFoundException extends ApiException {
    public ResourceNotFoundException(String messageKey, Object... args) {
        super(messageKey, args);
    }
}
