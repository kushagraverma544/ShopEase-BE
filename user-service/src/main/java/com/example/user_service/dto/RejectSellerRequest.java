package com.example.user_service.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class RejectSellerRequest {

    @NotBlank(message = "reason is required")
    private String reason;
}
