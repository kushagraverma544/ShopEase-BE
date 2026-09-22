package com.example.user_service.dto;

// SellerStatus (entity) sirf real DB states rakhta hai — "NONE" ek response-only value hai
// (user ne kabhi apply hi nahi kiya), isliye ye alag, entity se decoupled enum hai.
public enum SellerApplicationStatus {
    NONE,
    PENDING,
    APPROVED,
    REJECTED,
    HOLD,
    REVOKED
}
