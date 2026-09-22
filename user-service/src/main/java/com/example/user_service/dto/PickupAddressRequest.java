package com.example.user_service.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class PickupAddressRequest {

    @NotBlank(message = "addressLine1 is required")
    private String addressLine1;

    private String addressLine2;

    @NotBlank(message = "city is required")
    private String city;

    @NotBlank(message = "state is required")
    private String state;

    @NotBlank(message = "pincode is required")
    private String pincode;
}
