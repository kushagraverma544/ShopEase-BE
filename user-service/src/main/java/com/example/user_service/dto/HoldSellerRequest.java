package com.example.user_service.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class HoldSellerRequest {

    @NotBlank(message = "remark is required")
    private String remark;
}
