package com.example.user_service.dto;

import com.example.user_service.entity.BusinessType;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.util.List;
import lombok.Data;

@Data
public class SellerApplyRequest {

    @NotBlank(message = "storeName is required")
    private String storeName;

    @NotBlank(message = "businessName is required")
    private String businessName;

    @NotNull(message = "businessType is required")
    private BusinessType businessType;

    @NotBlank(message = "businessEmail is required")
    @Email(message = "businessEmail must be a valid email")
    private String businessEmail;

    @NotBlank(message = "businessPhone is required")
    private String businessPhone;

    private boolean sellsOnlyBooks;

    // Individual/proprietorship sellers ke paas formal registration nahi hota — panNumber hi
    // unka primary KYC hai, isliye ye field nullable hai.
    private String registrationNumber;

    @NotBlank(message = "panNumber is required")
    private String panNumber;

    @NotBlank(message = "bankAccountHolderName is required")
    private String bankAccountHolderName;

    @NotBlank(message = "bankAccountNumber is required")
    private String bankAccountNumber;

    @NotBlank(message = "ifscCode is required")
    private String ifscCode;

    @NotNull(message = "pickupAddress is required")
    @Valid
    private PickupAddressRequest pickupAddress;

    // Abhi sirf store hoti hai — kis category mein product daal sakta hai, ye enforce nahi karte.
    private List<String> categories;

    @NotNull(message = "initialProduct is required")
    @Valid
    private InitialProductRequest initialProduct;
}
