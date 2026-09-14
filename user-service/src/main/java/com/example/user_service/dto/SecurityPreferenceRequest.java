package com.example.user_service.dto;

import lombok.Data;

@Data
public class SecurityPreferenceRequest {
    private boolean otpLoginEnabled;
}
