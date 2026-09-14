package com.example.user_service.exception;

public class UnauthorizedException extends ApiException {
    public UnauthorizedException(String messageKey, Object... args) {
        super(messageKey, args);
    }
}
