package com.example.order_service.exception;

import com.example.order_service.dto.ErrorResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingRequestHeaderException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@RequiredArgsConstructor
@Slf4j
public class GlobalExceptionHandler {

    private final MessageSource messageSource;

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponse> handleNotFound(ResourceNotFoundException e, HttpServletRequest request) {
        return build(HttpStatus.NOT_FOUND, e, request);
    }

    @ExceptionHandler(ConflictException.class)
    public ResponseEntity<ErrorResponse> handleConflict(ConflictException e, HttpServletRequest request) {
        return build(HttpStatus.CONFLICT, e, request);
    }

    @ExceptionHandler(DownstreamServiceException.class)
    public ResponseEntity<ErrorResponse> handleDownstream(DownstreamServiceException e, HttpServletRequest request) {
        return build(HttpStatus.SERVICE_UNAVAILABLE, e, request);
    }

    // Ye do Spring ke apne built-in exceptions hain (missing @RequestHeader, malformed JSON body).
    // Inhe explicitly handle karna zaroori hai — nahi toh neeche wala generic Exception.class handler
    // inhe bhi pakad ke 500 de dega, jabki ye asal me client ki galti hai (400).
    @ExceptionHandler(MissingRequestHeaderException.class)
    public ResponseEntity<ErrorResponse> handleMissingHeader(MissingRequestHeaderException e,
            HttpServletRequest request) {
        String message = "Missing required header: " + e.getHeaderName();
        return ResponseEntity.badRequest()
                .body(new ErrorResponse(LocalDateTime.now(), HttpStatus.BAD_REQUEST.value(),
                        HttpStatus.BAD_REQUEST.getReasonPhrase(), message, request.getRequestURI()));
    }

    // @Valid @RequestBody fail hone pe ye exception aati hai — sab field errors ko ek message me jod ke
    // 400 return karte hain, taaki missing/invalid fields (null userId, blank productName, etc.) 500 na bane.
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponse> handleValidation(MethodArgumentNotValidException e,
            HttpServletRequest request) {
        String message = e.getBindingResult().getFieldErrors().stream()
                .map(fieldError -> fieldError.getField() + ": " + fieldError.getDefaultMessage())
                .collect(Collectors.joining(", "));
        return ResponseEntity.badRequest()
                .body(new ErrorResponse(LocalDateTime.now(), HttpStatus.BAD_REQUEST.value(),
                        HttpStatus.BAD_REQUEST.getReasonPhrase(), message, request.getRequestURI()));
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ErrorResponse> handleUnreadableBody(HttpMessageNotReadableException e,
            HttpServletRequest request) {
        return ResponseEntity.badRequest()
                .body(new ErrorResponse(LocalDateTime.now(), HttpStatus.BAD_REQUEST.value(),
                        HttpStatus.BAD_REQUEST.getReasonPhrase(), "Malformed request body",
                        request.getRequestURI()));
    }

    // Sabse aakhri fallback — koi bhi aur unexpected exception yahan aayega, stack trace client ko nahi jaayega.
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleGeneric(Exception e, HttpServletRequest request) {
        log.error("Unhandled exception", e);
        ErrorResponse body = new ErrorResponse(LocalDateTime.now(), HttpStatus.INTERNAL_SERVER_ERROR.value(),
                HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase(), "Something went wrong, please try again later",
                request.getRequestURI());
        return ResponseEntity.internalServerError().body(body);
    }

    private ResponseEntity<ErrorResponse> build(HttpStatus status, ApiException e, HttpServletRequest request) {
        String message = messageSource.getMessage(e.getMessageKey(), e.getArgs(), e.getMessageKey(),
                LocaleContextHolder.getLocale());
        ErrorResponse body = new ErrorResponse(LocalDateTime.now(), status.value(), status.getReasonPhrase(),
                message, request.getRequestURI());
        return ResponseEntity.status(status).body(body);
    }
}
