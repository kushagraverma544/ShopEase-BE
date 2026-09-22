package com.example.user_service.entity;

public enum SellerStatus {
    PENDING,
    APPROVED,
    REJECTED,
    // Admin ko kuch suspicious/incomplete laga — application reject nahi, seller correction karke
    // resubmit kar sakta hai (SellerService.apply() HOLD se PENDING mein wapas le aata hai).
    HOLD,
    // Seller ne khud apni PENDING/HOLD application withdraw kar di.
    REVOKED
}
