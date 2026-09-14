package com.example.user_service.dto;

import com.example.user_service.entity.AddressType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddressResponse {
    private Long id;
    private AddressType type;
    private String recipientName;
    private String phone;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String pincode;
    private boolean defaultAddress;
}
