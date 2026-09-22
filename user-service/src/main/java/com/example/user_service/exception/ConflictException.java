package com.example.user_service.exception;

public class ConflictException extends ApiException {
    public ConflictException(String messageKey, Object... args) {
        super(messageKey, args);
    }
}
