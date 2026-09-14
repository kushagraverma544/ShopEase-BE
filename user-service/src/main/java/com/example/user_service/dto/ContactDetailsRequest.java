package com.example.user_service.dto;

import lombok.Data;

@Data
public class ContactDetailsRequest {
    private String mobileNumber;
    private String alternateNumber;
}
