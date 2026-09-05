package com.example.order_service.service;

import com.example.order_service.dto.OrderDto;
import com.example.order_service.entity.IdempotencyKey;
import com.example.order_service.entity.IdempotencyStatus;
import com.example.order_service.repository.IdempotencyKeyRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class IdempotencyService {

    private final IdempotencyKeyRepository idempotencyKeyRepository;
    private final ObjectMapper objectMapper;

    // REQUIRES_NEW: apni khud ki chhoti transaction me turant commit hoti hai (downstream call se pehle),
    // taaki isi key ke saath aane wali duplicate requests ko turant (turant hi) constraint-violation mile,
    // 7s downstream wait ka intezaar na karna pade.
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public IdempotencyReservation reserve(String key) {
        try {
            IdempotencyKey entry = new IdempotencyKey();
            entry.setIdempotencyKey(key);
            entry.setStatus(IdempotencyStatus.PROCESSING);
            idempotencyKeyRepository.saveAndFlush(entry);
            return new IdempotencyReservation(true, entry);
        } catch (DataIntegrityViolationException e) {
            IdempotencyKey existing = idempotencyKeyRepository.findByIdempotencyKey(key)
                    .orElseThrow(() -> e);
            return new IdempotencyReservation(false, existing);
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void markCompleted(String key, OrderDto response) {
        IdempotencyKey entry = idempotencyKeyRepository.findByIdempotencyKey(key)
                .orElseThrow(() -> new IllegalStateException("Idempotency key not found: " + key));
        entry.setStatus(IdempotencyStatus.COMPLETED);
        entry.setResponseBody(writeAsJson(response));
        idempotencyKeyRepository.save(entry);
    }

    public OrderDto readStoredResponse(IdempotencyKey entry) {
        try {
            return objectMapper.readValue(entry.getResponseBody(), OrderDto.class);
        } catch (JsonProcessingException e) {
            throw new IllegalStateException("Could not read stored idempotent response", e);
        }
    }

    private String writeAsJson(OrderDto dto) {
        try {
            return objectMapper.writeValueAsString(dto);
        } catch (JsonProcessingException e) {
            throw new IllegalStateException("Could not serialize order response", e);
        }
    }
}
