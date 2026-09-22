package com.example.user_service.dto.external;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

// inventory-service jo poora product object return karta hai usme se sirf "id" chahiye
// (SellerProfile.productId pe store karne ke liye) — baaki fields ignore karte hain.
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class InventoryProductResponse {
    private Long id;
    private boolean active;
}
