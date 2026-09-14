package com.example.user_service.dto;

import com.example.user_service.entity.AddressType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AddressRequest {

    @NotNull(message = "type is required")
    private AddressType type;

    @NotBlank(message = "recipientName is required")
    private String recipientName;

    @NotBlank(message = "phone is required")
    private String phone;

    @NotBlank(message = "addressLine1 is required")
    private String addressLine1;

    private String addressLine2;

    @NotBlank(message = "city is required")
    private String city;

    @NotBlank(message = "state is required")
    private String state;

    @NotBlank(message = "pincode is required")
    private String pincode;

    private boolean defaultAddress;
}
