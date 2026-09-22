package com.example.user_service.dto;

import com.example.user_service.entity.BusinessType;
import com.example.user_service.entity.SellerStatus;
import java.time.LocalDateTime;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// Poori business/KYC detail wala view — do callers use karte hain: admin (kisi bhi seller ki
// application review karte waqt) aur seller khud (apna "/seller/profile" dekhte waqt, jahan customer
// wala MyDetailsResponse kaafi nahi hai kyunki usme business info hoti hi nahi). Dono cases mein
// poori detail dikhana sahi hai — ya toh apni khud ki application hai, ya admin trusted role hai.
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerProfileResponse {
    private Long id;
    private Long userId;
    private String storeName;
    private String businessName;
    private BusinessType businessType;
    private String businessEmail;
    private String businessPhone;
    private boolean sellsOnlyBooks;
    private String registrationNumber;
    private String panNumber;
    private String bankAccountHolderName;
    private String bankAccountNumber;
    private String ifscCode;
    private String pickupAddressLine1;
    private String pickupAddressLine2;
    private String pickupCity;
    private String pickupState;
    private String pickupPincode;
    private List<String> categories;
    private Long productId;
    private SellerStatus status;
    private String adminRemark;
    private LocalDateTime appliedAt;
    private LocalDateTime reviewedAt;
    private LocalDateTime correctionSubmittedAt;
}
