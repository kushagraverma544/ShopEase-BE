package com.example.order_service.exception;

public class DownstreamServiceException extends ApiException {
    public DownstreamServiceException(String messageKey, Object... args) {
        super(messageKey, args);
    }
}
