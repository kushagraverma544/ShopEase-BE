package com.example.order_service.exception;

// Base for all handled exceptions — carries a messages.properties key + args instead of a hardcoded string,
// so GlobalExceptionHandler can resolve the actual text centrally.
public abstract class ApiException extends RuntimeException {

    private final String messageKey;
    private final transient Object[] args;

    protected ApiException(String messageKey, Object... args) {
        super(messageKey);
        this.messageKey = messageKey;
        this.args = args;
    }

    public String getMessageKey() {
        return messageKey;
    }

    public Object[] getArgs() {
        return args;
    }
}
